jQuery(function($) {
	
	$.ajax({
		  url: "https://fiddle.jshell.net/favicon.png",
		  beforeSend: function( xhr ) {
		    xhr.overrideMimeType( "text/plain; charset=x-user-defined" );
		  }
		})
		  .done(function( data ) {
		    if ( console && console.log ) {
		      console.log( "Sample of data:", data.slice( 0, 100 ) );
		    }
		  });
	
});