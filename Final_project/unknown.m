function [filter_coefficients] = unknown(cutoff_freq, filter_order, filter_type)    
    % Filter Design
    switch filter_type
        case 'lowpass'
            filter_coefficients = fir1(filter_order, cutoff_freq);
        case 'highpass'
            filter_coefficients = fir1(filter_order, cutoff_freq, 'high');
        case 'bandpass'
            % Specify the band frequencies (normalized frequency, 0.0 to 1.0)
            band_freq = [0.2 0.4];
            filter_coefficients = fir1(filter_order, band_freq);
        case 'bandstop'
            % Specify the band frequencies (normalized frequency, 0.0 to 1.0)
            band_freq = [0.2 0.4];
            filter_coefficients = fir1(filter_order, band_freq, 'stop');
        otherwise
            error('Invalid filter type.');
    end
end
