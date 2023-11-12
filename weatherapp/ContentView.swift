import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, SA")
                MainWeatherStatusView(imageName: isNight ? "cloud.moon.fill" :"cloud.sun.fill", temperature: 37)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 39)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.rain.fill", temperature: 39)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 39)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 39)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 39)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    ButtonView(text: "Cambiar el día")
                }
                
                Spacer()
            }
            
    
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding(6)
            VStack(spacing: 8){
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)º")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool // aca no seria tan necesario, si no vamos a cambiar desde dentro del componente el valor del estado, no hace falta el binding
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,  isNight ? .gray :  Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)º")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}


