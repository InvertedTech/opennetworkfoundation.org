const Matrix = require('matrix-api/Matrix').Matrix;

// In your main application

document.addEventListener('click', event => {

	if(!event.target.matches('[data-role="login-button"]'))
	{
		return;
	}

	// Connect to your Matrix endpoint:
	const baseUrl = 'https://matrix.org/_matrix';
	const matrix  = new Matrix(baseUrl);

	// Open the login popup, targetting the url from the first step:

	const redirectUrl = location.origin.match(/github.io$/)
		? location.origin + '/opennetworkfoundation.org/accept-sso'
		: location.origin + '/accept-sso';

	matrix.initSso(redirectUrl);

	// ... and wait for the user to log in:

	matrix.addEventListener('logged-in', event => {

		console.log('Logged in!', event);

		// Start polling the server
		matrix.listenForServerEvents();

		// Act on events of only one type:
		matrix.addEventListener('m.room.message', event => console.log('Message:', event));

		// Act on events of another type:
		matrix.addEventListener('m.reaction', event => console.log('Reaction:', event));

		// Act on ALL events from the server:
		matrix.addEventListener('matrix-event', event => console.log('Event:', event));

	});

}, {capture: true});

