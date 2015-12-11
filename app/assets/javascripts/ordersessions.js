function addToCartOnClick(target){
	var quantity = 1;
	if ($('#orderqty_'+target.id.toString()).val() !== undefined){
		quantity = $('#orderqty_'+target.id.toString()).val();
	}
	$.post( homeUrl+'/ordersession/orders_add', 
					{ product_id: target.id, quantity: quantity})
	.done(function( data ) {
		console.log(data);
		if(data.error===undefined){
			alert( "Added to Cart!" );
			location.reload();
		} else {
			alert(data.error);
			location.reload();
		}
	})
	.fail(function( data ) {
		alert('fail to connect to server...');
	})
	.always(function(){
		
	});
}

function updateCartOnClick(target){
	var quantity = 1;
	if ($('#orderqty_'+target.id.toString()).val() !== undefined){
		quantity = $('#orderqty_'+target.id.toString()).val();
	}
	$.post( homeUrl+'/ordersession/orders_update', 
					{ product_id: target.id, quantity: quantity})//$('#orderqty_'+target.id.toString()).val() })
	.done(function( data ) {
		console.log(data);
		if(data.error===undefined){
			alert( "Cart Updated!" );
			location.reload();
		} else {
			alert(data.error);
			location.reload();
		}
	})
	.fail(function( data ) {
		alert('fail to connect to server...');
	})
	.always(function(){

	});
}

function removeFromCartOnClick(target){
	$.post( homeUrl+'/ordersession/orders_remove', 
					{ product_id: target.id })
	.done(function( data ) {
		console.log(data);
		if(data.error===undefined){
			alert( "Removed from Cart!" );
			location.reload();
		} else {
			alert(data.error);
			location.reload();
		}
	})
	.fail(function( data ) {
		alert('fail to connect to server...');
	})
	.always(function(){
		
	});
}

$(document).ready(function(e) {
	$('.btn-add-to-cart').click(function(e){ addToCartOnClick(this) });
	$('.btn-update-cart').click(function(e){ updateCartOnClick(this) });
	$('.btn-remove-from-cart').click(function(e){ removeFromCartOnClick(this) });
});