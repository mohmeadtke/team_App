import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../State_mangmeant/bloc/join_team_bloc.dart';

class JoinDialog extends StatefulWidget {
  final dynamic data;

  const JoinDialog({super.key, required this.data});

  @override
  State<JoinDialog> createState() => _JoinDialogState();
}

class _JoinDialogState extends State<JoinDialog> {
  final TextEditingController _controller = TextEditingController();
  String? error;

  void _handleJoin() {
    if (_controller.text == widget.data.password) {
      context
          .read<JoinTeamBloc>()
          .add(JoinTheTeamEvent(teamId: widget.data.teamId));

      Navigator.of(context).pop(); // Close dialog
      Navigator.of(context).pop(); // Close dialog
    } else {
      setState(() {
        error = "Incorrect password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[800],
              child: widget.data.teamImage == ""
                  ? const Icon(Icons.group, size: 30, color: Colors.white70)
                  : ClipOval(
                      child: Image.network(
                        widget.data.teamImage,
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.data.teamName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Enter Password",
                labelStyle: const TextStyle(color: Colors.white70),
                errorText: error,
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleJoin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text("Join"),
            )
          ],
        ),
      ),
    );
  }
}
