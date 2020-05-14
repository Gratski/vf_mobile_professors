import 'package:professors/services/rest/rest.services.dart';
import 'package:professors/store/auth/auth_state.dart';
import 'package:professors/store/general/general_state.dart';
import 'package:professors/store/navigation/nav_state.dart';
import 'package:professors/store/notifications/settings_notifications_state.dart';
import 'package:professors/store/payments/settings_payments_state.dart';
import 'package:professors/store/profile_details_state.dart';
import 'package:professors/store/transactions/transactions_history_state.dart';
import 'package:professors/store/user/user_state.dart';
import 'package:professors/store/user/user_wallet_state.dart';

// Services
final restServices = RestServices();

// stores
final authStore = AuthState();
final generalStore = GeneralState();
final navStore = NavState();
final userStore = UserState();
final notificationsStore = SettingsNotificationsState(); // user notification settings
final profileDetailsStore = ProfileDetailsState();
final userWallet = UserWalletState();
final transactionsHistoryStore = TransactionsHistoryState();
final paymentsStore = SettingsPaymentsState();