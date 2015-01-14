package js.npm;

import js.npm.express.Middleware;
import js.npm.express.Request;
import js.npm.express.Response;

typedef PassportAuthenticateOptions = {
	?successRedirect : String,
	?failureRedirect : String,
	?failureFlash : String,
	?successFlash : String,
	?scope : Array<String>,
	?display : String,
	?session : Bool
}

typedef PassportUser = Dynamic;
typedef PassportInfo = Dynamic;

extern class Passport 
implements npm.Package.Require<"passport","*">
{
	public static function authenticate(mode:String , ?options : PassportAuthenticateOptions , ?cb : Null<Dynamic> -> Null<PassportUser> -> Null<PassportInfo> -> Void ) : Middleware<Request, Response>;
	public static function use( strategy : js.npm.passport.Strategy ) : Void;
	public static function initialize() : Middleware<Request, Response>;
	public static function session() : Middleware<Request, Response>;
	public static function serializeUser( method : Dynamic -> ( Dynamic -> Dynamic -> Void ) -> Void ) : Void;
	public static function deserializeUser( method : Dynamic -> ( Dynamic -> Dynamic -> Void ) -> Void ) : Void;

	public static inline function user( req : js.node.http.ClientRequest ) : PassportUser {
		return untyped req.user;
	}
	public static inline function logout( req : js.node.http.ClientRequest ) : Void {
		return untyped req.logout();
	} 
}