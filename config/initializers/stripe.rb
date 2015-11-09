#Rails.configuration.stripe = {
  #:publishable_key => ENV['pk_test_mRUhfoPmViu0MlRmMMV3KTJD'],
  #:secret_key      => ENV['sk_test_H1BxF1F4A2RDA1Lx3FP6hfHm']
#}

#Stripe.api_key = Rails.configuration.stripe[:secret_key]

Stripe.api_key = "sk_test_H1BxF1F4A2RDA1Lx3FP6hfHm"
STRIPE_PUBLIC_KEY = "pk_test_mRUhfoPmViu0MlRmMMV3KTJD"

#Stripe.api_key = ENV["STRIPE_API_KEY"]
#STRIPE_PUBLIC_KEY = ENV["STRIPE_PUBLIC_KEY"]