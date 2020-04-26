import 'package:professors/store/classes/classes_state.dart';
import 'package:professors/store/dashboard/dashboard_state.dart';
import 'package:professors/store/navigation/nav_state.dart';
import 'package:professors/store/notifications/notifications_state.dart';
import 'package:professors/store/notifications/settings_notifications_state.dart';
import 'package:professors/store/payments/methods/settings_payment_methods_state.dart';
import 'package:professors/store/payments/settings_payments_state.dart';
import 'package:professors/store/support/support_contact_state.dart';
import 'package:professors/store/transactions/transactions_history_state.dart';

final navStore = NavState(); // Instantiate the store
final dashboardStore = DashboardState(); // Dashboard State
final transactionsHistoryStore = TransactionsHistoryState(); // settings transactions
final notificationsStore = SettingsNotificationsState(); // settings notifications
final paymentsStore = SettingsPaymentsState(); // settings payments
final paymentMethodsStore = SettingsPaymentMethodsState(); // settings payment methods
final supportStore = SupportContactState(); // settings support account
final feedNotificationsStore = NotificationsState(); // Feed Notifications
final classesStore = ClassesState(); // Classes Store