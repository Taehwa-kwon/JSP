	//객체를 생성하는 생성자 함수 : 객체 생성함요 
		function Rectangle(width,height){
			this.width = width;
			this.height = height;
			// Getter 값을 꺼내기 위함 
			this.getWidth = function(){
				return this.width;
			}
			this.getHeight = function(){
				return this.height;
			}
			// Setter 값을 넣기위함 
			this.setWidth = function( w){
				if(w < 0)
					throw '넓이는 음수가 될 수 없습니다.';
				else
					this.width = w;
					
				this.width = w;
			}
			this.setHeight = function(h){
				if (h <0 )
					throw '길이가 0이 될 수 없습니다.';
				else 
					this.height = h;
			}
			//메소드는 프로토타입으로 빼주는게 좋다.
		}		
			//method : prototype
			Rectangle.prototype.getArea = function(){
				return this.getWidth() * this.getHeight();
			}
			
			try {
				var rect1 = new Rectangle(5,7) //이건 Rectangle() 을 호출한 것
				alert("면적 : " + rect1.getArea() );
				rect1.setWidth(-2)
				alert("면적 : " + rect1.getArea() );
			} catch (e) {
				alert(e);
			}finally{
			}
			
//			var msg = "";
	//		alert(msg);
	
	//객체상속
	function Square(length){
		this.base = Rectangle; //부모클래스를 지정 : extends Rectangle
		this.base (length, length); 
		//부모생성자 호출 : Rectangle(length,length)을 호출해서 값을 채운다. 자바의 super(length, length) 과 같다
	}
	Square.prototype  = Rectangle.prototype; //프로토 타입도 상속받을수 있게 해준다. 
	Square.prototype.constructor = Square; //생성자를 지정한다.  
	
	//변수 지정
	var rect2 = new Rectangle(7,8);
	var squr  = new Square(7) // Square의 인스턴스인 squr 이 
	alert(rect2.getArea()+ ',' + squr.getArea())
	
