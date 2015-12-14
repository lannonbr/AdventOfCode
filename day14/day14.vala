// This can be compiled with 'valac --pkg gio-2.0 day14.vala -o day14'

public class Deer : Object {
	
	public string name;
	public int speed;
	public int runLength;
	public int restLength;

	public int score;

	private int _position;
	private bool resting;
	private int timeTillRest;
	private int timeTillGo;

	public Deer(string name, int speed, int runLength, int restLength) {
		this.name = name;
		this.speed = speed;
		this.runLength = runLength;
		this.restLength = restLength;

		score = 0;

		resting = false;
		timeTillRest = runLength;
	}

	public void move() {
		if(!resting) {
			position += speed;
			timeTillRest--;
			if(timeTillRest == 0) {
				resting = true;
				timeTillGo = restLength;
			}
		} else {
			timeTillGo--;
			if(timeTillGo == 0) {
				resting = false;
				timeTillRest = runLength;
			}
		}

	}

	public int position {
		get { return _position; }
		set { _position = value; }
	}
}

class Race : Object {

	public Deer[] deers;

	public Race() {
		deers = {};
	}

	public static void main(string[] args) {
		Race race = new Race();

		var file = File.new_for_path("input.dat");

		try {
			var dis = new DataInputStream(file.read());
			string line;

			while((line = dis.read_line(null)) != null) {
				string[] str_split = line.split(" ");
				string name = str_split[0];
				int speed = int.parse(str_split[3]);
				int runLength = int.parse(str_split[6]);
				int restLength = int.parse(str_split[13]);

				Deer d = new Deer(name, speed, runLength, restLength);
				race.deers += d;
			}
		} catch(Error e) {
			error("%s", e.message);
		}

		foreach(Deer deer in race.deers) {
			stdout.printf("Deer: %s\n", deer.name);
		}

		for(int i = 0; i < 2503; i++) {
			int[] topDeerIdxs = {};
			int topDistance = 0;

			for(int a = 0; a < race.deers.length; a++) {
				race.deers[a].move();
			}
			for(int a = 0; a < race.deers.length; a++) {
				if(race.deers[a].position > topDistance) {
					topDeerIdxs = {};
					topDeerIdxs += a;
					topDistance = race.deers[a].position;
				} else if(race.deers[a].position == topDistance) {
					topDeerIdxs += a;
				}
			}
			for(int c = 0; c < topDeerIdxs.length; c++) {
				race.deers[topDeerIdxs[c]].score += 1;
			}
		}
		
		string topDeer = "";
		int topDistance = 0;

		foreach(Deer deer in race.deers) {
			if(deer.position > topDistance) {
				topDeer = deer.name;
				topDistance = deer.position;
			}
			stdout.printf("Deer: %s, %d\n", deer.name, deer.position);
		}

		stdout.printf("\nTOP DEER (PT 1)\n--------------\n%s: %d km\n", topDeer, topDistance);

		string topDeer2 = "";
		int topScore = 0;
		foreach(Deer deer in race.deers) {
			if(deer.score > topScore) {
				topDeer2 = deer.name;
				topScore = deer.score;
			}
		}

		stdout.printf("\nTOP DEER (PT 2)\n---------------\n%s: %d points\n", topDeer2, topScore);
	}
}
