part of '../weather_screen.dart';

class _ErrorStateView extends StatelessWidget {
  const _ErrorStateView(this.error);

  final CheckWeatherError error;

  @override
  Widget build(BuildContext context) {
    return switch (error) {
      CheckWeatherError.noConnection => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('No internet connection')),
          const SizedBox(height: 12),
          uikit.Button(
            onTap: () =>
                context.read<CheckWeatherBloc>().add(const RetryEvent()),
            text: context.tr.shared.retry,
          ),
        ],
      ),
      CheckWeatherError.serverError => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Something went wrong')),
          const SizedBox(height: 12),
          uikit.Button(
            onTap: () =>
                context.read<CheckWeatherBloc>().add(const RetryEvent()),
            text: context.tr.shared.retry,
          ),
        ],
      ),
      CheckWeatherError.serviceUnavailable => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Service unavailable')),
          const SizedBox(height: 12),
          uikit.Button(
            onTap: () =>
                context.read<CheckWeatherBloc>().add(const RetryEvent()),
            text: context.tr.shared.retry,
          ),
        ],
      ),
    };
  }
}
