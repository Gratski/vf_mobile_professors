import 'package:professors/store/classes/classes_state.dart';
import 'package:professors/store/dashboard/dashboard_state.dart';
import 'package:professors/store/nationalities/nationalities_state.dart';
import 'package:professors/store/navigation/nav_state.dart';
import 'package:professors/store/notifications/notifications_state.dart';
import 'package:professors/store/notifications/settings_notifications_state.dart';
import 'package:professors/store/payments/methods/settings_payment_methods_state.dart';
import 'package:professors/store/payments/settings_payments_state.dart';
import 'package:professors/store/support/support_contact_state.dart';
import 'package:professors/store/transactions/transactions_history_state.dart';

final navStore = NavState();
final dashboardStore = DashboardState();
final transactionsHistoryStore = TransactionsHistoryState();
final notificationsStore = SettingsNotificationsState();
final paymentsStore = SettingsPaymentsState();
final paymentMethodsStore = SettingsPaymentMethodsState();
final supportStore = SupportContactState();
final feedNotificationsStore = NotificationsState();
final classesStore = ClassesState(); // Classes Store
final nationalitiesStore = NationalitiesState(); // Nationalities