Hg::Assistant::Engine.routes.draw do
  post '/', to: 'fulfillment#fulfill'
end
