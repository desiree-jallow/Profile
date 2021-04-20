//
//  ProfileScreen.swift
//  Profile
//
//  Created by Desiree on 4/20/21.
//

import SwiftUI

struct ThemeTextField: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .cornerRadius(5)
    }
}

struct ProfileScreen: View {
    @State private var profile = ProfileModel()
    var body: some View {
        NavigationView {
            Form {
                Text("Basic Information")
                Section {
                    TextField("First Name", text: $profile.firstName)
                    TextField("Last Name", text: $profile.lastName)
                    TextField("Age", text: $profile.age)
                }
                Text("Shipping Information")
                Section {
                    TextField("Street Address", text: $profile.streetAddress)
                    TextField("State / Province", text: $profile.stateProvince)
                    TextField("Country", text: $profile.country)
                    TextField("Postal Code", text: $profile.postalCode)
                }
                Section {
                    ProfilePreview(profile: profile)
                }
            }
            .textFieldStyle(ThemeTextField())
            .navigationBarTitle("Profile")
            .navigationBarItems(trailing: Button("Submit", action: {
                submit()
            }))
            
        }
    }
    
    private func submit() {
        UserService.instance.saveProfile(profile: profile)
        profile = ProfileModel()
    }
}

struct ProfilePreview: View {
    var profile: ProfileModel
    var body: some View {
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("First Name: \(profile.firstName)")
            Text("Last Name: \(profile.lastName)")
            Text("Age : \(profile.age)")
        })
            
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
