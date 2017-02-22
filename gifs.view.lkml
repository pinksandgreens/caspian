view: gifs {

  dimension: image_filewowgif {
    hidden: yes
    sql: ('http://i.imgur.com/bhpwRzb.gifv') ;;
  }

  dimension: image_filewowgif2 {
    hidden: no
    sql: ${image_filewowgif} ;;
    html: <img src="{{ value }}" width="1000" 0height="1000"/>;;
  }





  dimension: image_filewowgif5 {
    hidden: yes
    sql: ('https://24.media.tumblr.com/tumblr_lz9llfNffE1qjffwko1_250.gif') ;;
  }

  dimension: image_filewowgif6 {
    hidden: no
    sql: ${image_filewowgif5} ;;
    html: <img src="{{ value }}" width="1000" 0height="1000"/>;;
  }







  dimension: image_filewowgif11 {
    hidden: yes
    sql: ('http://i.imgur.com/Ekrt89j.gifv') ;;
  }

  dimension: image_filewowgif12 {
    hidden: no
    sql: ${image_filewowgif11} ;;
    html: <img src="{{ value }}" width="1000" 0height="1000"/>;;
  }







  dimension: image_filewowgif21 {
    hidden: yes
    sql: ('https://i.redd.it/drkhg1nfb85y.gif') ;;
  }

  dimension: image_filewowgif22 {
    hidden: no
    sql: ${image_filewowgif21} ;;
    html: <img src="{{ value }}" width="1000" 0height="1000"/>;;
  }

}
