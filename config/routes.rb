Artledbrasil::Application.routes.draw do
  

get "pagamento/finalizarpedido"  
  
get "produto/cadastro"

get "usuario/cadastro"

post "usuario/cadastrarusuario"

post "produto/cadastrarProduto" 
  
get "admin/homepage"


get "pedido/consulta"

post "pedido/consultarpedido"


post "application/retornapesquisa"


post "pedido/atualizarquantidade"

post "/pedido/atualizartotalprodutopedido"

post "produto/retornapesquisa"

post "produto/editar"

post "produto/excluir"

post "pedido/incluirprodutocarrinho"

get "produto/edicao"
get "usuario/edicao"

get "produto/excluir"
get "usuario/excluir"

patch  "produto/atualizarproduto"
resources :produtos

patch  "usuario/atualizarusuario"
resources :usuarios

get "produto/detalhar"

post "pedido/exibircarrinho"


post "usuario/alterarsenha"

get "usuario/alteracaoperfil"

post "usuario/alterarperfilacesso"

get "pedido/finalizar"

get "pedido/excluirprodutocarrinho"

get "pedido/incluirprodutocarrinho"

get  "login/login"


get  "usuario/perfilacesso"

post "usuario/retornalistausuarios"

get "pagamento/finalizar"

post "login/autenticar"

get "login/logout"


post "pedido/detalharusuario"

post "pedido/detalharpedido"


get "home/index"

post "application/pesquisartodosprodutos"

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
