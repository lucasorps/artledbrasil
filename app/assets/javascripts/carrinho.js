/**
 * @author lucasorps
 */


$( document ).ready(function() {
$('#carrinho_modal').hide();

	

});


function excluirLinha() {

	

	excluirLinha = function(handler) {
    var tr = $(handler).closest('tr');

    tr.fadeOut(400, function(){ 
      tr.remove(); 
   
	if($('#tbody_tabela_lista_produtos tr').length == 0){
		$('#tbody_tabela_lista_produtos').html("<tr><td colspan=4>Não há produtos dentro da lista no momento</td></tr>");
	}  
	
	
	}); 

	
	
    
  };

     
  
};


function exibirCarrinho(){
	
	$('#carrinho_modal').fadeIn("slow");
	
}




 $('#comprar').click () ->
   

$.ajax( {
type : "POST",
url : "/produto/pesquisarProdutoPeloCodigo",
data : {'codigo': codigo },
success : function(dado){

carrinho = {nome: dado.nome, quantidade:$("#input_qtd").val(), preco: dado.preco_unitario}
preco_total += dado.preco_unitario,


$('.botaoExcluir').click (){

	excluiProduto

}
	
	
$('.campo_quantidade').change(){

$.ajax( {
type : "POST",
url : "/pedido/calculaPrecoFinal",
data : {'codigo': id, 'quantidade':$.(this).val() },
success : function(resultado){

$.("#label_preco_total").html(resultado), 

}