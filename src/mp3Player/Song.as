package mp3Player {
	import flash.errors.IOError;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	
	// This class is implemented to organize a sound file with its metadata within the Flash program
	public class Song {
		private var m_id:Number;
		private var m_target:Sound;
		private var m_channel:SoundChannel;
		private var m_title:String;
		private var m_artist:String;
		private var m_playstate:Boolean;
		private var m_position:Number;
		
		public function Song(inID:Number, inURL:String, inTitle:String, inArtist:String) {
			m_id = inID;
			m_target = new Sound();
			m_target.load(new URLRequest(inURL));
			m_title = inTitle;
			m_artist = inArtist;
			m_channel = new SoundChannel();
			m_playstate = false;
			m_position = 0;
		}
		
		//NOTE: No setters because the idea is that the user would never set these things manually....
		//HOWEVER: Setter methods could easily be written if one ever wanted to extend this program
		public function getID():Number {
			return m_id;
		}
		
		public function getTarget():Sound {
			return m_target;
		}
		
		public function getTitle():String {
			return m_title;
		}
		
		public function getArtist():String {
			return m_artist;
		}
		
		public function getChannel():SoundChannel {
			return m_channel;
		}
		
		public function getPlayState():Boolean {
			return m_playstate;
		}
		
		public function getPosition():Number {
			return m_position;
		}
		
		public function playSong():void {
			if (m_playstate == false) {
				m_channel = m_target.play(m_position);
				m_playstate = true;				
			}
		}
		
		public function pauseSong():void {
			if (m_playstate == true) {
				m_position = m_channel.position;
				m_playstate = false;
				m_channel.stop();
			}
		}
		
		public function stopSong():void {
			if (m_playstate == true) {
				m_position = 0;
				m_playstate = false;
				m_channel.stop();
			}
		}	
	}
}