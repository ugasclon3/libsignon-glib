/* signon.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Signon", gir_namespace = "Signon", gir_version = "1.0", lower_case_cprefix = "signon_")]
namespace Signon {
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", type_id = "signon_auth_service_get_type ()")]
	public class AuthService : GLib.Object {
		[CCode (has_construct_function = false)]
		public AuthService ();
		public void query_mechanisms (string method, Signon.QueryMechanismCb cb);
		public void query_methods (Signon.QueryMethodsCb cb);
	}
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", type_id = "signon_auth_session_get_type ()")]
	public class AuthSession : GLib.Object {
		[CCode (has_construct_function = false)]
		public AuthSession (uint id, string method_name) throws GLib.Error;
		public void cancel ();
		public unowned string get_method ();
		public void process (GLib.HashTable<string,GLib.Value?> session_data, string mechanism, Signon.AuthSessionProcessCb cb);
		public void query_available_mechanisms (string wanted_mechanisms, Signon.AuthSessionQueryAvailableMechanismsCb cb);
		public signal void state_changed (int object, string p0);
	}
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", type_id = "signon_identity_get_type ()")]
	public class Identity : GLib.Object {
		[CCode (has_construct_function = false)]
		public Identity ();
		public void add_reference (string reference, Signon.IdentityReferenceAddedCb cb, void* user_data);
		public Signon.AuthSession create_session (string method) throws GLib.Error;
		[CCode (has_construct_function = false)]
		public Identity.from_db (uint32 id);
		public unowned GLib.Error get_last_error ();
		public void query_info (Signon.IdentityInfoCb cb);
		public void remove (Signon.IdentityRemovedCb cb, void* user_data);
		public void remove_reference (string reference, Signon.IdentityReferenceRemovedCb cb, void* user_data);
		public void store_credentials_with_args (string username, string secret, bool store_secret, GLib.HashTable<string,string[]> methods, string caption, string realms, string access_control_list, Signon.IdentityType type, Signon.IdentityStoreCredentialsCb cb);
		public void store_credentials_with_info (Signon.IdentityInfo info, Signon.IdentityStoreCredentialsCb cb);
		public void verify_secret (string secret, Signon.IdentityVerifyCb cb);
		[NoAccessorMethod]
		public uint id { get; set; }
		[HasEmitter]
		public signal void signout ();
	}
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "signon_identity_info_get_type ()")]
	[Compact]
	public class IdentityInfo {
		[CCode (has_construct_function = false)]
		public IdentityInfo ();
		public Signon.IdentityInfo copy ();
		public void free ();
		[CCode (array_length = false, array_null_terminated = true)]
		public unowned string[] get_access_control_list ();
		public unowned string get_caption ();
		public int get_id ();
		public Signon.IdentityType get_identity_type ();
		public unowned GLib.HashTable<string,string[]> get_methods ();
		[CCode (array_length = false, array_null_terminated = true)]
		public unowned string[] get_realms ();
		public bool get_storing_secret ();
		public unowned string get_username ();
		public void remove_method (string method);
		public void set_access_control_list (string access_control_list);
		public void set_caption (string caption);
		public void set_identity_type (Signon.IdentityType type);
		public void set_method (string method, string mechanisms);
		public void set_realms (string realms);
		public void set_secret (string secret, bool store_secret);
		public void set_username (string username);
	}
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cprefix = "SIGNON_IDENTITY_TYPE_")]
	[Flags]
	public enum IdentityType {
		OTHER,
		APP,
		WEB,
		NETWORK
	}
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cprefix = "SIGNON_POLICY_")]
	public enum SessionDataUiPolicy {
		DEFAULT,
		REQUEST_PASSWORD,
		NO_USER_INTERACTION,
		VALIDATION
	}
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cprefix = "SIGNON_ERROR_")]
	public errordomain Error {
		UNKNOWN,
		INTERNAL_SERVER,
		INTERNAL_COMMUNICATION,
		PERMISSION_DENIED,
		METHOD_NOT_KNOWN,
		SERVICE_NOT_AVAILABLE,
		INVALID_QUERY,
		METHOD_NOT_AVAILABLE,
		IDENTITY_NOT_FOUND,
		STORE_FAILED,
		REMOVE_FAILED,
		SIGNOUT_FAILED,
		IDENTITY_OPERATION_CANCELED,
		CREDENTIALS_NOT_AVAILABLE,
		REFERENCE_NOT_FOUND,
		MECHANISM_NOT_AVAILABLE,
		MISSING_DATA,
		INVALID_CREDENTIALS,
		NOT_AUTHORIZED,
		WRONG_STATE,
		OPERATION_NOT_SUPPORTED,
		NO_CONNECTION,
		NETWORK,
		SSL,
		RUNTIME,
		SESSION_CANCELED,
		TIMED_OUT,
		USER_INTERACTION,
		OPERATION_FAILED,
		ENCRYPTION_FAILED,
		TOS_NOT_ACCEPTED,
		FORGOT_PASSWORD,
		METHOD_OR_MECHANISM_NOT_ALLOWED,
		INCORRECT_DATE,
		USER_ERROR;
		public static GLib.Quark quark ();
	}
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 3.9)]
	public delegate void AuthSessionProcessCb (Signon.AuthSession self, owned GLib.HashTable<string,GLib.Value?> session_data, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 3.9)]
	public delegate void AuthSessionQueryAvailableMechanismsCb (Signon.AuthSession self, [CCode (array_length = false, array_null_terminated = true)] owned string[] mechanisms, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 3.9)]
	public delegate void AuthSessionQueryAvailableMethodsCb (Signon.AuthSession self, [CCode (array_length = false, array_null_terminated = true)] owned string[] mechanisms, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 3.9)]
	public delegate void IdentityInfoCb (Signon.Identity self, Signon.IdentityInfo info, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 2.9)]
	public delegate void IdentityReferenceAddedCb (Signon.Identity self, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 2.9)]
	public delegate void IdentityReferenceRemovedCb (Signon.Identity self, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 2.9)]
	public delegate void IdentityRemovedCb (Signon.Identity self, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 2.9)]
	public delegate void IdentitySignedOutCb (Signon.Identity self, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 3.9)]
	public delegate void IdentityStoreCredentialsCb (Signon.Identity self, uint32 id, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 3.9)]
	public delegate void IdentityVerifyCb (Signon.Identity self, bool valid, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 2.9)]
	public delegate void IdentityVoidCb (Signon.Identity self, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 4.9)]
	public delegate void QueryMechanismCb (Signon.AuthService auth_service, string method, [CCode (array_length = false, array_null_terminated = true)] owned string[] mechanisms, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", instance_pos = 3.9)]
	public delegate void QueryMethodsCb (Signon.AuthService auth_service, [CCode (array_length = false, array_null_terminated = true)] owned string[] methods, GLib.Error error);
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cname = "SIGNON_SESSION_DATA_CAPTION")]
	public const string SESSION_DATA_CAPTION;
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cname = "SIGNON_SESSION_DATA_PROXY")]
	public const string SESSION_DATA_PROXY;
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cname = "SIGNON_SESSION_DATA_REALM")]
	public const string SESSION_DATA_REALM;
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cname = "SIGNON_SESSION_DATA_RENEW_TOKEN")]
	public const string SESSION_DATA_RENEW_TOKEN;
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cname = "SIGNON_SESSION_DATA_SECRET")]
	public const string SESSION_DATA_SECRET;
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cname = "SIGNON_SESSION_DATA_TIMEOUT")]
	public const string SESSION_DATA_TIMEOUT;
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cname = "SIGNON_SESSION_DATA_UI_POLICY")]
	public const string SESSION_DATA_UI_POLICY;
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cname = "SIGNON_SESSION_DATA_USERNAME")]
	public const string SESSION_DATA_USERNAME;
	[CCode (cheader_filename = "libsignon-glib/signon-glib.h", cname = "SIGNON_SESSION_DATA_WINDOW_ID")]
	public const string SESSION_DATA_WINDOW_ID;
}
