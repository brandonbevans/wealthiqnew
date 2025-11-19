//
//  Config.swift
//  prime
//
//  Created on 11/17/25.
//
//  IMPORTANT: Supabase configuration is loaded from Info.plist
//  Update the values in Info.plist with your actual Supabase credentials
//

import Foundation

/// Application configuration for Supabase
///
/// To set up:
/// 1. Open Info.plist in Xcode
/// 2. Update the following keys with your Supabase credentials:
///    - SUPABASE_URL: Your Supabase project URL (e.g., https://xyzcompany.supabase.co)
///    - SUPABASE_ANON_KEY: Your Supabase anon/public API key
/// 3. These should match the values in `/frontend/.env.local`:
///    - SUPABASE_URL = NEXT_PUBLIC_SUPABASE_URL
///    - SUPABASE_ANON_KEY = NEXT_PUBLIC_SUPABASE_ANON_KEY
/// 4. If not available, get them from your Supabase project dashboard:
///    - Navigate to Settings > API
///    - Copy your Project URL and anon/public API key
///
/// Security Note: The anon key is safe to use in client applications
/// as it's designed for public access with Row Level Security (RLS)
struct Config {
  /// Your Supabase project URL
  /// Loaded from Info.plist SUPABASE_URL key
  /// Same as NEXT_PUBLIC_SUPABASE_URL in frontend/.env.local
  static var supabaseURL: String {
    print("🔍 [Config] Loading SUPABASE_URL from Info.plist...")
    let rawValue = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL")
    print("🔍 [Config] Raw value type: \(type(of: rawValue))")
    print("🔍 [Config] Raw value: \(String(describing: rawValue))")
    
    guard let url = rawValue as? String else {
      print("❌ [Config] SUPABASE_URL not found or invalid in Info.plist")
      print("❌ [Config] Available Info.plist keys: \(Bundle.main.infoDictionary?.keys.joined(separator: ", ") ?? "none")")
      fatalError("SUPABASE_URL not found in Info.plist. Please add your Supabase project URL.")
    }
    
    print("✅ [Config] SUPABASE_URL loaded: \(url)")
    return url
  }

  /// Your Supabase anon/public API key
  /// Loaded from Info.plist SUPABASE_ANON_KEY key
  /// Same as NEXT_PUBLIC_SUPABASE_ANON_KEY in frontend/.env.local
  static var supabaseAnonKey: String {
    print("🔍 [Config] Loading SUPABASE_ANON_KEY from Info.plist...")
    let rawValue = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_ANON_KEY")
    print("🔍 [Config] Raw value type: \(type(of: rawValue))")
    print("🔍 [Config] Raw value: \(String(describing: rawValue))")
    
    guard let key = rawValue as? String else {
      print("❌ [Config] SUPABASE_ANON_KEY not found or invalid in Info.plist")
      fatalError("SUPABASE_ANON_KEY not found in Info.plist. Please add your Supabase anon key.")
    }
    
    let maskedKey = key.count > 10 ? "\(key.prefix(10))...\(key.suffix(10))" : "***"
    print("✅ [Config] SUPABASE_ANON_KEY loaded: \(maskedKey)")
    return key
  }
  
  /// ElevenLabs API Key
  static var elevenLabsApiKey: String {
    // Return empty string if not found to allow app to run, but feature might fail
    return Bundle.main.object(forInfoDictionaryKey: "ELEVENLABS_API_KEY") as? String ?? ""
  }
  
  /// ElevenLabs Agent ID
  static var elevenLabsAgentId: String {
     // Return empty string if not found to allow app to run, but feature might fail
    return Bundle.main.object(forInfoDictionaryKey: "ELEVENLABS_AGENT_ID") as? String ?? ""
  }
  
  /// ElevenLabs Voice ID
  static var elevenLabsVoiceId: String {
     // Return empty string if not found to allow app to run, but feature might fail
    return Bundle.main.object(forInfoDictionaryKey: "ELEVENLABS_VOICE_ID") as? String ?? ""
  }

  /// Validate that the configuration has been set
  static var isConfigured: Bool {
    print("🔍 [Config] Checking if configuration is valid...")
    let urlRaw = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL")
    let keyRaw = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_ANON_KEY")
    
    print("🔍 [Config] URL raw value: \(String(describing: urlRaw))")
    print("🔍 [Config] Key raw value: \(String(describing: keyRaw))")
    
    // Try to load both values and check they're not empty
    if let url = urlRaw as? String,
      let key = keyRaw as? String
    {
      let isValid = !url.isEmpty && !key.isEmpty
      print("✅ [Config] Configuration valid: \(isValid)")
      print("   - URL: \(url)")
      print("   - Key length: \(key.count)")
      return isValid
    }
    
    print("❌ [Config] Configuration invalid - missing or empty values")
    return false
  }
}

/// Helper to load configuration from environment or plist if needed
/// This can be enhanced to load from Info.plist or environment variables
extension Config {
  static func loadFromEnvironment() {
    // Optional: Load from Info.plist
    if let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
      NSDictionary(contentsOfFile: path) != nil
    {
      // Load values from plist if available
      // This allows keeping sensitive data out of source control
    }

    // Optional: Load from environment variables during development
    // ProcessInfo.processInfo.environment["SUPABASE_URL"] ?? supabaseURL
  }
}
