{
 :user {
        :plugins [[lein-exec "0.3.7"]]
        }
 :repl {
        :dependencies [[cljfmt "0.5.1"] [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]]
        :plugins [[lein-cljfmt "0.6.7"]
                  [jonase/eastwood "0.3.10"]
                  [cider/cider-nrepl "0.24.0"]]}}
