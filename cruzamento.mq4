






input int media1;
input int media2;
input int hora;
bool st=false;
string mns="-----";
bool cap=true;
bool compra=false;
bool venda=false;
bool order_compra=true;
bool order_venda=true;

void OnTick(){

Comment ("Mensagem: ",mns);

if (Hour()==hora){

st=true;
mns="AUTORIZADO!!!";
}

if (st==true && cap==true ){

if (iMA(NULL,0,media1,0,MODE_SMA,PRICE_CLOSE,0) < iMA(NULL,0,media2,0,MODE_SMA,PRICE_CLOSE,0)){

mns="AGUARDANDO COMPRA!!!";
compra=true;
cap=false;

}else{

mns="AGUARDANDO VENDA!!!";
venda=true;
cap=false;
}

}



if (compra==true){


if (iMA(NULL,0,media1,0,MODE_SMA,PRICE_CLOSE,0) > iMA(NULL,0,media2,0,MODE_SMA,PRICE_CLOSE,0) && order_compra==true){

int C = OrderSend(Symbol(),OP_BUY,0.01,Ask,5,Bid-1500*Point,Bid+3000*Point,0);

order_compra=false;
}

}


if (venda==true){


if (iMA(NULL,0,media1,0,MODE_SMA,PRICE_CLOSE,0) < iMA(NULL,0,media2,0,MODE_SMA,PRICE_CLOSE,0) && order_venda==true){

int V = OrderSend(Symbol(),OP_SELL,0.10,Bid,5,Bid+1500*Point,Bid-3000*Point,0);

order_venda=false;
}


}








}




