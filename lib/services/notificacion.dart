import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // Configuración de los ajustes de inicialización para Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/azteca'); // Usando el ícono de la aplicación

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Configuración del canal de notificaciones
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'payments_channel', // ID del canal
      'Notificaciones de Pagos', // Nombre del canal
      description:
          'Canal para notificaciones relacionadas con pagos', // Descripción del canal
      importance: Importance.max, // Importancia del canal
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> showNotification() async {
    print('Showing two notifications'); // Confirmar que esta función se llama

    // Configuración para la primera notificación
    const AndroidNotificationDetails androidPlatformChannelSpecifics1 =
        AndroidNotificationDetails(
      'payments_channel', // ID del canal (debe ser el mismo para ambas notificaciones)
      'Notificaciones de Pagos',
      channelDescription: 'Canal para notificaciones relacionadas con pagos',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker1',
    );

    const NotificationDetails platformChannelSpecifics1 =
        NotificationDetails(android: androidPlatformChannelSpecifics1);

    await _flutterLocalNotificationsPlugin.show(
      1, // ID único de la primera notificación
      'Ofertas y Beneficios', // Título
      'Disfruta de las ofertas y beneficios que Banco Azteca ofrece.', // Cuerpo
      platformChannelSpecifics1,
      payload: 'item x1', // Payload opcional
    );

    // Configuración para la segunda notificación
    const AndroidNotificationDetails androidPlatformChannelSpecifics2 =
        AndroidNotificationDetails(
      'payments_channel', // ID del canal (debe ser el mismo para ambas notificaciones)
      'Notificaciones de Pagos',
      channelDescription: 'Canal para notificaciones relacionadas con pagos',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker2',
    );

    const NotificationDetails platformChannelSpecifics2 =
        NotificationDetails(android: androidPlatformChannelSpecifics2);

    await _flutterLocalNotificationsPlugin.show(
      2, // ID único de la segunda notificación
      'Deposito', // Título
      'Se realizo el deposito de \$2,000,000 a tu cuenta.', // Cuerpo
      platformChannelSpecifics2,
      payload: 'item x2', // Payload opcional
    );
  }
}
