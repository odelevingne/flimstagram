$(document).ready(function(){
	$('body').on('click', '.btn-like', function(event){
		event.preventDefault();
		console.log(this);
		$.post(this.href);
		$(this).removeClass('btn-like').addClass('btn-unlike');
	});

	var connection = new WebSocketRails(window.location.host + '/websocket');
	channel = connection.subscribe('likes');
	channel.bind('new', function(post) {
		var postElem = $('.post[data-id=' + post.id + '] .btn-unlike')
		postElem.text('♥ ' + post .new_like_count);
	});
})


$(document).ready(function(){
	$('body').on('click', '.btn-unlike', function(event){
		event.preventDefault();
		$.ajax({ url: this.href, type: 'delete' });
		$(this).removeClass('btn-unlike').addClass('btn-like');
	});

	var connection = new WebSocketRails(window.location.host + '/websocket');
	channel = connection.subscribe('likes');
	channel.bind('destroy', function(post) {
		var postElem = $('.post[data-id=' + post.id + '] .btn-like')
		postElem.text('♥ ' + post .new_like_count);
	});
})