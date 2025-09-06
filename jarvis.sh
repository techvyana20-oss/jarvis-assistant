#!/data/data/com.termux/files/usr/bin/bash

clear
echo "🔵 Booting JARVIS..."
espeak "Booting JARVIS. Hello Sir, I am your assistant."

while true; do
  echo -e "\n🔷 Command me, Sir:"
  read -p "➤ " cmd

  case $cmd in
    "time")
      echo "🕒 Current time is:"
      date +"%T"
      espeak "The current time is $(date +%T)"
      ;;

    "date")
      echo "📅 Today's date is:"
      date +"%A, %d %B %Y"
      espeak "Today is $(date +"%A, %d %B %Y")"
      ;;

    "weather")
      echo "🌦️ Fetching weather..."
      curl -s wttr.in/?format=3
      espeak "Here is your weather report"
      ;;

    "joke")
      echo "😂 Here's a joke for you:"
      joke=$(curl -s https://icanhazdadjoke.com/ -H "Accept: text/plain")
      echo "$joke"
      espeak "$joke"
      ;;

    "news")
      echo "📰 Top headline:"
      news=$(curl -s https://inshortsapi.vercel.app/news?category=technology | jq -r '.data[0].title')
      echo "$news"
      espeak "$news"
      ;;

    "open youtube")
      echo "📺 Opening YouTube..."
      termux-open-url https://youtube.com
      espeak "Opening YouTube"
      ;;

    "open google")
      echo "🔍 Opening Google..."
      termux-open-url https://google.com
      espeak "Opening Google"
      ;;

    "exit")
      echo "👋 Goodbye Sir."
      espeak "Goodbye Sir, see you soon."
      break
      ;;

    *)
      echo "❓ Unknown command: $cmd"
      espeak "Sorry, I did not understand that"
      ;;
  esac
done
