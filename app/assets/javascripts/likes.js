$(document).ready(function(){
	$('.btn-like').on('click', function(event){
		event.preventDefault();
		$.post(this.href);
	});

	var connection = new WebSocketRails(window.location.host + '/websocket');
	channel = connection.subscribe('likes');
	channel.bind('new', function(post) {
		var postElem = $('.post[data-id=' + post.id + '] .btn-like')
		postElem.text('♥ ' + post .new_like_count);
	});
})


$(document).ready(function(){
	$('.btn-unlike').on('click', function(event){
		event.preventDefault();
		$.post(this.href);
	});

	var connection = new WebSocketRails(window.location.host + '/websocket');
	channel = connection.subscribe('likes');
	channel.bind('destroy', function(post) {
		var postElem = $('.post[data-id=' + post.id + '] .btn-unlike')
		postElem.text('♥ ' + post .new_like_count);
	});
})