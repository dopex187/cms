<?php
if(isset($_GET['t']) && !empty($_GET['t'])) {
  $text = $_GET['t'];
  
  if(isset($_GET['w'])) {
    $times = $_GET['w'];  
  }else{
    $times = strlen($_GET['t']) + 0.7;
  }
  if(isset($_GET['s'])) {
    $s = $_GET['s'];
    } else {
        $s = 10;
    }
  $font = $s;
  if(isset($_GET['n'])) {
      $height = imagefontheight($font) * 1.5;
  }else{
      if(isset($_GET['h'])) {
          $height = $_GET['h'];
      }else{
          $height = imagefontheight($font);
      }
      
  }

  $width  = imagefontwidth($font) * $times;

  ///text?t=Drones&w=16&s=12&color=white&font=1&b=grey
  $image = imagecreatetruecolor ($width,$height);
  $white = imagecolorallocate ($image,255,255,255);
  $black = imagecolorallocate ($image,0,0,0);
  $blackBG = imagecolorallocate ($image,27,27,27);
  $lightestBlue = imagecolorallocate($image,211,224,250);
  $green = imagecolorallocate ($image,29,201,10);
  $red = imagecolorallocate ($image,255,10,10);
  $darkblue = imagecolorallocate ($image,32,82,121);
  $blue = imagecolorallocate ($image,0,145,255);
  $grey = imagecolorallocate($image, 111,111,111);

  if(isset($_GET['b'])) {
    imagefill($image, 0, 0, $$_GET['b']);
    imagecolortransparent($image, $$_GET['b']);
  } else {
    imagefill($image, 0, 0, $black);
    imagecolortransparent($image, $black);   
  }
  if(isset($_GET['font'])) {
    $fon = "fonts/EurostileTHeaCon.ttf";
  } else {
    $fon = "fonts/EurostileTHea.ttf";
  }

  if(isset($_GET['color'])) {
    //$color = $_GET['color'];
    switch($_GET['color']) 
    {
      case "lightestBlue": $color = $lightestBlue; break;
      case "black": $color = $black; break;
      case "blackBG": $color = $blackBG; break;
      case "green": $color = $green; break;
      case "red": $color = $red; break;
      case "darkblue": $color = $darkblue; break;
      case "blue": $color = $blue; break;
      case "grey": $color = $grey; break;
      default: $color = $white; break;
    }
  } else {
    $color = $white;
  }
  if(isset($_GET['n'])) {
    imagettftext($image, $s, 0, 7, 11, $color, $fon, $text);
    if(isset($_GET['ns'])) {
      imagettftext($image, $_GET['ns'], 0, $_GET['nw'], 22, $color, $fon, $_GET['n']);    
    } else {
      imagettftext($image, $s, 0, 5, 22, $color, $fon, $_GET['n']);    
    }
  } else {
    if(isset($_GET['h'])){
      if(isset($_GET['ph'])){
        imagettftext($image, $s, 0, 0, $_GET['ph'], $color, $fon, $text);
      } else {
        imagettftext($image, $s, 0, 0, $_GET['h'], $color, $fon, $text);
      }
    } else{ 
      imagettftext($image, $s, 0, 0, 11, $color, $fon, $text);
    }
  }
  header("Content-type: image/gif");
  ImageGif($image);
  imagedestroy($image); 
}