import UIKit
import AVFoundation
class ViewController: UIViewController, UITextFieldDelegate
{
    //TextField
    @IBOutlet weak var LoveWorld: UITextField!
    //button
    @IBOutlet weak var LoveTalk: UIButton!
    //Segmented
    @IBOutlet weak var ChangeLanguageSegmented: UISegmentedControl!
    //Speed
    //Slider
    @IBOutlet weak var SpeedSlider: UISlider!
    //Label
    @IBOutlet weak var SpeedLabel: UILabel!
    //Tone
    //Slider
    @IBOutlet weak var ToneSlider: UISlider!
    //Label
    @IBOutlet weak var ToneLabel: UILabel!
    //Voice
    //Slider
    @IBOutlet weak var VoiceSlider: UISlider!
    //Label
    @IBOutlet weak var VoiceLabel: UILabel!
    //SegmentedControl
    @IBOutlet weak var ChangeLanguage: UISegmentedControl!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //執行按下return收回鍵盤
        LoveWorld.delegate = self
    }
    //按下return收回鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
    }
   
    
    //AVSpeechSynthesizer 是發出聲音的合成器
    let Synthesizer = AVSpeechSynthesizer()
    
    public func speak()
    {
    
    //AVSpeechUtterance 是要講的話
      let StartSpeak = AVSpeechUtterance(string: LoveWorld.text!)
        //設定語言
        if ChangeLanguage.selectedSegmentIndex == 1
        {
            StartSpeak.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        }
        else if ChangeLanguage.selectedSegmentIndex == 2
        {
            StartSpeak.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        }
    
        //調整速度
        StartSpeak.rate = SpeedSlider.value
        //調整音量
        StartSpeak.volume = VoiceSlider.value
       //調整音調
        StartSpeak.pitchMultiplier = ToneSlider.value
        //設定暫停跟繼續
        if Synthesizer.isPaused
        {
            Synthesizer.continueSpeaking()
                }
        else {
            Synthesizer.speak(StartSpeak)
    }
        
        
    }
    
    
    public func pause()
    {
        Synthesizer.pauseSpeaking(at:  .immediate)
      }
    
    
    //開始
    @IBAction func StartSpeak(_ sender: UIButton)
    {
        speak()
    }
    //暫停
    @IBAction func Stop(_ sender: UIButton)
    {
        pause()
    }
    //繼續
    @IBAction func GoOn(_ sender: UIButton)
    {
        speak()
    }
    
    
    
    
    
    //速度數值文字
    @IBAction func ShowSpeed(_ sender: UISlider)
    {
        SpeedLabel.text =
        String(format: "%.2f", SpeedSlider.value)
    }
    //音調數值文字
    @IBAction func ShowTone(_ sender: UISlider)
    {
        ToneLabel.text = String(format: "%.2f", ToneSlider.value)
    }
    //音量數值文字
    
    @IBAction func ShowVolume(_ sender: UISlider)
    {
        VoiceLabel.text = String(format: "%.2f", VoiceSlider.value)
    }
    

    
    
    
}
