%% input location to mp3 file and beginning prefix and number of files.
%Note that the files must be labled from <file_loc + prefix><1:n>.mp3
%Creates images of the mp3 in the in the time and frequency domain by performing a Fourier transform
%Then the beats of the song are generated to segment the song into structural motifs
%Finally, the song is converted to Mel-frequency cepstrum, which is a linear cosine transform of a log power spectrum to analyze frequency patterns
function genFourierBeatsSegment(file_locs,n)
	for i = i:n
		fileName = strcat(file_locs,int2str(i),'.mp3');
		[data, Fs] = audioread(fileName);
		data = data(:,1);
		Nsamps = length(data);
		t = (1/Fs)*(1:Nsamps);          %Prepare time data for plot
		
		%Do Fourier Transform
		y_fft = abs(fft(data));            %Retain Magnitude
		y_fft = y_fft(1:Nsamps/2);      %Discard Half of Points
		f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot
		%Plot Sound File in Time Domain
		h = figure
		plot(t, data)
		xlabel('Time (s)')
		ylabel('Amplitude')
		title(strcat('J',int2str(i),' in Time Domain'))
		saveas(h,strcat('J',int2str(i),'time'),'jpg');
    
		%Plot Sound File in Frequency Domain
		h = figure
		plot(f, y_fft)
		xlim([0 1000])
		xlabel('Frequency (Hz)')
		ylabel('Amplitude')
		title(strcat('J',int2str(i),' in Frequency Domain'))
		saveas(h,strcat('J',int2str(i),'freq'),'jpg');

		%Now generate beats
		beatFileName = strcat(file_locs,int2str(i),'.beats');
		davies_standard(fileName,beatFileName); %generate beats
		glob = strcat('j',int2str(i),'.mp3');
		J{i} = filefun(q_alg, [PATH_WAV22050 glob], 'args', args);
		%Now find the Mel-frequency ceptrum and segment the song by structural motifs
		mfc_j{i+10} = segment(fileName,J{i}); %get mfccs
end

