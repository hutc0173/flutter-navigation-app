import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/dogs.jpeg'),
                  fit: BoxFit.cover,
                ),
                color: theme.colorScheme.surface,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: theme.colorScheme.primary,
              child: Center(
                child: Transform.scale(
                  scale: 1.5,
                  child: Text(
                    'Bedlington Terriers',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
