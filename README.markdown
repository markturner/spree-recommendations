# Fork
Updating https://github.com/paulcc/spree-recommendations to use new Spree 1.1 style extension

Installation
------------

To use this extension, add the following to your Gemfile:

    gem 'spree-recommendations', :git => 'git://github.com/vijayh/spree-recommendations.git'

Run:
  
    $ bundle
    $ bundle exec rails g spree_recommendations:install

If you want to use the recommended products partial, you just need to render it within a view, like so:

    render "spree/shared/recommendations"

(e.g. within app/views/spree/products/_properties)
    
Lastly, you can override the the recommended products partial within your own app by creating your own in:

    your_app/app/views/spree/shared/_recommendations



# Spree Recommendations

## Intro

Adaptation of BDQ's accessories extension to give a similar notion of recommendations which can be set by the administrator

Defaults to a random set of (n = 3) items, drawing more from the product's taxon if insufficient recommendation entries are available.

See paulcc's fork of spree-demo to see this code in actual use

## Using this extension

No views included here: basically, you should be using some of your own short-detail product listing code for this.

Spree has a +shared/products+ partial, so you can feed in a list of recommendations to show, eg have something like
this on your product show page:

    <%= render :partial => "shared/products.html.erb", :locals => {:products => random_recommendations(@product, 4), :taxon => @taxon } %>


## Future plans

* Adding a "customers also bought" method, derived by order analysis (soon)
* Tie into rating system?
* Frequent joint purchases?


## Acknowledgements

Thanks to BDQ for the original accessories code, and to BryanMTL for the jquery code!

