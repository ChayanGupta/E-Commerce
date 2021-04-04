function add_to_cart(pid,pname,price)
    	{
    		document.getElementById("myBtn").disabled = false;
    		let cart=localStorage.getItem("cart")
    		if(cart==null || cart.length==0)
    		{
    			
    			let products=[];
    			let product={productId:pid,productName:pname,productQuantity:1,productPrice:price}
    			products.push(product);
    			localStorage.setItem("cart",JSON.stringify(products));
    			console.log("product is added for first time")
               
    		}
    		else
    		{
    			document.getElementById("myBtn").disabled = false;
    			let pcart=JSON.parse(cart);
    			let oldProduct=pcart.find((item)=>item.productId==pid)
				console.log(oldProduct)
    			if(oldProduct)
    			{
    				oldProduct.productQuantity=oldProduct.productQuantity+1
    				pcart.map((item)=>{
    					if(item.productId==oldProduct.productId)
    					{
    						item.productQuantity=oldProduct.productQuantity;
    					}
    				});
    				localStorage.setItem("cart",JSON.stringify(pcart));
    				console.log("product quantity increased")
                  
    			}
    			else
    			{
    				let product={productId:pid,productName:pname,productQuantity:1,productPrice:price}
        			pcart.push(product);
        			localStorage.setItem("cart",JSON.stringify(pcart));
        			console.log("product is added")
										
    			}
    		}
			updateCart();
    	}

//update cart:

function updateCart()
{
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart == null || cart.length == 0)
	{
		document.getElementById("myBtn").disabled = true;
		console.log("Cart is empty!!")
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3 style='color:red'>Cart does not have any items</h3>");
		$(".checkout-btn").addClass('disabled');
	}
	else
	{
		//there is some in cart to show
		document.getElementById("myBtn").disabled = false;
		console.log(cart)
		$(".cart-items").html(`(${cart.length})`);
		let table=`
			<table class='table'>
			<thead class='thread-light'>
				<tr>
					<th>Item Name</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th>Item Total</th>
					<th class="text-center">Action</th>
				</tr>
			</thead>
		`;
		
		let totalPrice=0;
		cart.map((item)=>{
			
			table+=`
					<tr style="color:rgb(171, 71, 188)">
						<td style="font-size:18px">${item.productName}</td>
						<td class="text-center" style="font-size:25px">$${item.productPrice}</td>
						<td class="text-center" style="font-size:25px">${item.productQuantity}</td>
						<td class="text-center" style="font-size:25px">$${item.productQuantity * item.productPrice}</td>
						<td><button onClick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-xs">Remove</button></td>
					</tr>
			`
			totalPrice+=item.productPrice*item.productQuantity;
		})
		
		table=table+`
					<tr><td colspan='5' class='text-right font-weight-bold' style="font-size:25px; color:rgb(255, 0, 0)">Grand Total : $${totalPrice}</td></tr>
		
		</table>`
		
		$(".cart-body").html(table);
		$(".checkout-btn").removeClass('disabled');
	}
	
}

//delete item

function deleteItemFromCart(pid)
{
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newcart=cart.filter((item)=>item.productId!=pid)
	
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
	
}

function delete_local()
{
	let p=[];
	localStorage.setItem("cart",JSON.stringify(p));
	updateCart();
}