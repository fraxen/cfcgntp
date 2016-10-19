<cfscript>
/*

Is designed to run as a singleton

Copyright Hugo Ahlenius
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component output='false' {
	gc = '';
	app = '';
	ntype = '';

	public any function init(string host='localhost', string password='', string application='#APPLICATION.applicationname#', any icon=javaCast( "null", 0 ), numeric port=23053) {
		variables.gc = createObject('java', 'net.sf.libgrowl.GrowlConnector').init(ARGUMENTS.host, ARGUMENTS.port);
		variables.app = createObject('java', 'net.sf.libgrowl.Application').init(ARGUMENTS.application, ARGUMENTS.icon);
		variables.ntype = createObject('java', 'net.sf.libgrowl.NotificationType').init('message');
		try {
			variables.gc.setPassword(ARGUMENTS.password);
		}
		catch(any e) {}
		variables.gc.register(variables.app, [variables.ntype]);
		return this;
	}

	public void function notify(required string title, required string message, any icon=javaCast( "null", 0 ), number priority=0, boolean sticky=false) {
		var note = createObject('java', 'net.sf.libgrowl.Notification').init(variables.app, variables.ntype, ARGUMENTS.Title, ARGUMENTS.message);
		note.setPriority(ARGUMENTS.priority);
		note.setSticky(ARGUMENTS.sticky);
		if (ARGUMENTS.icon != '') {
			note.setIcon(ARGUMENTS.icon);
		}
		variables.gc.notify(note);
	}
}
</cfscript>
