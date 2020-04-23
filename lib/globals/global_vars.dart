import 'package:professors/store/dashboard/dashboard_state.dart';
import 'package:professors/store/navigation/nav_state.dart';
import 'package:professors/store/notifications/settings_notifications_state.dart';
import 'package:professors/store/transactions/transactions_history_state.dart';

final navStore = NavState(); // Instantiate the store
final dashboardStore = DashboardState(); // Dashboard State
final transactionsHistoryStore = TransactionsHistoryState(); // settings transactions
final notificationsStore = SettingsNotificationsState(); // settings notifications