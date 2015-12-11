function addToCartOnClick(target){
	$.post( homeUrl+'/ordersession/orders_add', 
					{ product_id: target.id, quantity: $('#orderqty_'+target.id.toString()).val() })
	.done(function( data ) {
		console.log(data);
		if(data.error===undefined){
			alert( "Added to Cart!" );
		} else {
			alert(data.error);
		}
	})
	.fail(function( data ) {
		console.log('fail to connect to server...');
	})
	.always(function(){
		location.reload();
	});
}

function updateCartOnClick(target){
	$.post( homeUrl+'/ordersession/orders_update', 
					{ product_id: target.id, quantity: $('#orderqty_'+target.id.toString()).val() })
	.done(function( data ) {
		console.log(data);
		if(data.error===undefined){
			alert( "Cart Updated!" );
		} else {
			alert(data.error);
		}
	})
	.fail(function( data ) {
		console.log('fail to connect to server...');
	})
	.always(function(){
		location.reload();
	});
}

$(document).ready(function(e) {
	$('.btn-add-to-cart').click(function(e){ addToCartOnClick(this) });
	$('.btn-update-cart').click(function(e){ updateCartOnClick(this) });
});