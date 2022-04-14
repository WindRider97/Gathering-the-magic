<?php
require_once "app/models/Collection.php";
require_once "app/models/TestCard.php";
class CollectionController
{
    public function index()
    {
        $collection = Collection::fetchAll(1);
        return Helper::view("Collection", ["collection" => $collection]);
    }

    public function parseAddCard()
    {
        if($_SERVER['REQUEST_METHOD'] === 'POST')
        {
            //New condition needed when user is implemented
            if(isset($_POST['card_id']))
            {
                $collection = new Collection;
                $collection->setCardId($_POST['card_id']);
                if(isset($_POST['possession']))
                {
                    if($_POST['possession'] == "owned")
                    {
                        $collection->setOwned(true);
                    }                    
                    else
                    {
                        $collection->setOwned(false);
                    }
                }
                if(isset($_POST['quantity']))
                {
                    $collection->setQuantity($_POST['quantity']);
                }
                $collection->setUserId(1);
                $collection->save();
                $collection = Collection::fetchAll(1);
                return Helper::view("Collection", ["collection" => $collection]);
                exit();
            }
            else
            {
                $collection = Collection::fetchAll(1);
                return Helper::view("Collection", ["collection" => $collection]);
                exit();
            }
        }
    }
    public function parseRemoveCard()
    {
       //TODO REMOVE CARD
       if($_SERVER['REQUEST_METHOD'] === 'POST')
        {
            //New condition needed when user is implemented
            if(isset($_POST['card_id']))
            {
                $collection = new Collection;
                $collection->setCardId($_POST['card_id']);
                if(isset($_POST['possession']))
                {
                    if($_POST['possession'] == "owned")
                    {
                        $collection->setOwned(true);
                    }                    
                    else
                    {
                        $collection->setOwned(false);
                    }
                }
                if(isset($_POST['quantity']))
                {
                    $collection->setQuantity($_POST['quantity']);
                }
                $collection->setUserId(1);
                // TODO THE DELETE $collection->delete();
                $collection = Collection::fetchAll(1);
                return Helper::view("Collection", ["collection" => $collection]);
                exit();
            }
            else
            {
                $collection = Collection::fetchAll(1);
                return Helper::view("Collection", ["collection" => $collection]);
                exit();
            }
        }
    }
    public function show()
    {
        if(isset($_GET["id"]) && ctype_digit($_GET["id"]))
        {
            $card = TestCard::fetchId($_GET["id"]);

            if($card == null)
            {
                // raising an exception maybe not the best solution
                throw new Exception("CARD NOT FOUND.", 1);
            }
        }
        else {
            throw new Exception("CARD NOT FOUND.", 1);
        }

        return Helper::view("CardCollection",[
                'card' => $card,
            ]);
    }
}