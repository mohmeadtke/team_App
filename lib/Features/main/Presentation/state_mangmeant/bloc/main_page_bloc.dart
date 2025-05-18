import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Entity/team_entity.dart';
import 'package:teamapp/Features/main/Domain/Entity/teams_entity.dart';
import 'package:teamapp/Features/main/Domain/UseCase/check_user_have_team_usecase.dart';
import 'package:teamapp/Features/main/Domain/UseCase/get_data_of_team_usecase.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CheckUserHaveTeamUsecase checkUserHaveTeamUsecase;
  final GetDataOfTeamUsecase getDataOfTeamUsecase;
  MainPageBloc(
      {required this.checkUserHaveTeamUsecase,
      required this.getDataOfTeamUsecase})
      : super(MainPageInitial()) {
    on<CheckIfUserHaveTeam>((event, emit) async {
      emit(MainPageLoadingState());

      final succesOrFailure = await checkUserHaveTeamUsecase.call();
      print("teams id is $succesOrFailure");
      succesOrFailure.fold(
        (failure) => emit(
          MainPageFiallurState(messge: failure.toString()),
        ),
        (data) {
          print("teams id is $data");
          add(GetTeamsData(teamsId: data));
        },
      );
    });
    on<GetTeamsData>((event, emit) async {
      emit(MainPageLoadingState());
      print("teams id is ${event.teamsId}");
      final succesOrFailure = await getDataOfTeamUsecase.call(event.teamsId);
      print("teams data is $succesOrFailure");
      emit(succesOrFailure.fold(
        (failure) => MainPageFiallurState(messge: failure.toString()),
        (data) {
          return MainPageSuccsesState(data: data);
        },
      ));
    });
  }
}
