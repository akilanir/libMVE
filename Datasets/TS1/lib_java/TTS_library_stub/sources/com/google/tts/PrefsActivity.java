package com.google.tts;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import com.google.tts.TTS;
import com.google.tts.TextToSpeechBeta;
import java.util.HashMap;

/* loaded from: TTS_library_stub.jar:com/google/tts/PrefsActivity.class */
public class PrefsActivity extends PreferenceActivity {
    private static final int TTS_VOICE_DATA_CHECK_CODE = 42;
    private static final int TTS_VOICE_DATA_INSTALL_CODE = 43;
    private TTS myTts;
    private HashMap<String, Integer> hellos;
    private TTS.InitListener ttsInitListener = new TTS.InitListener() { // from class: com.google.tts.PrefsActivity.1
        @Override // com.google.tts.TTS.InitListener
        public void onInit(int version) {
            PrefsActivity.this.addPreferencesFromResource(R.xml.prefs);
            PrefsActivity.this.loadEngines();
            PrefsActivity.this.loadHellos();
            Preference previewPref = PrefsActivity.this.findPreference("preview");
            previewPref.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.google.tts.PrefsActivity.1.1
                @Override // android.preference.Preference.OnPreferenceClickListener
                public boolean onPreferenceClick(Preference preference) {
                    PrefsActivity.this.sayHello();
                    return true;
                }
            });
        }
    };

    @Override // android.preference.PreferenceActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setVolumeControlStream(3);
        this.myTts = new TTS((Context) this, this.ttsInitListener, true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadEngines() {
        ListPreference enginesPref = (ListPreference) findPreference("engine_pref");
        Intent intent = new Intent("android.intent.action.START_TTS_ENGINE");
        PackageManager pm = getPackageManager();
        ResolveInfo[] enginesArray = (ResolveInfo[]) pm.queryIntentActivities(intent, 0).toArray(new ResolveInfo[0]);
        CharSequence[] entries = new CharSequence[enginesArray.length];
        CharSequence[] values = new CharSequence[enginesArray.length];
        for (int i = 0; i < enginesArray.length; i++) {
            entries[i] = enginesArray[i].loadLabel(pm);
            ActivityInfo aInfo = enginesArray[i].activityInfo;
            String soFilename = String.valueOf(aInfo.name.replace(String.valueOf(aInfo.packageName) + ".", "")) + ".so";
            values[i] = "/data/data/" + aInfo.packageName + "/lib/libtts" + soFilename.toLowerCase();
        }
        enginesPref.setEntries(entries);
        enginesPref.setEntryValues(values);
        enginesPref.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() { // from class: com.google.tts.PrefsActivity.2
            @Override // android.preference.Preference.OnPreferenceChangeListener
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                String chosenEngine = newValue.toString();
                if (chosenEngine.equals("/data/data/com.svox.pico/lib/libttspico.so")) {
                    Intent intent2 = new Intent();
                    intent2.setAction(TextToSpeechBeta.Engine.ACTION_CHECK_TTS_DATA);
                    intent2.setClassName(TextToSpeechBeta.Engine.DEFAULT_SYNTH, "com.svox.pico.CheckVoiceData");
                    PrefsActivity.this.startActivityForResult(intent2, PrefsActivity.TTS_VOICE_DATA_CHECK_CODE);
                    return true;
                }
                return true;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadHellos() {
        this.hellos = new HashMap<>();
        this.hellos.put("afr", Integer.valueOf(R.string.af));
        this.hellos.put("bos", Integer.valueOf(R.string.bs));
        this.hellos.put("yue", Integer.valueOf(R.string.zhrHK));
        this.hellos.put("cmn", Integer.valueOf(R.string.zh));
        this.hellos.put("hrv", Integer.valueOf(R.string.hr));
        this.hellos.put("ces", Integer.valueOf(R.string.cz));
        this.hellos.put("nld", Integer.valueOf(R.string.nl));
        this.hellos.put("eng-USA", Integer.valueOf(R.string.enrUS));
        this.hellos.put("eng-GBR", Integer.valueOf(R.string.enrGB));
        this.hellos.put("epo", Integer.valueOf(R.string.eo));
        this.hellos.put("fin", Integer.valueOf(R.string.fi));
        this.hellos.put("fra", Integer.valueOf(R.string.fr));
        this.hellos.put("deu", Integer.valueOf(R.string.de));
        this.hellos.put("ell", Integer.valueOf(R.string.el));
        this.hellos.put("hin", Integer.valueOf(R.string.hi));
        this.hellos.put("hun", Integer.valueOf(R.string.hu));
        this.hellos.put("isl", Integer.valueOf(R.string.is));
        this.hellos.put("ind", Integer.valueOf(R.string.id));
        this.hellos.put("ita", Integer.valueOf(R.string.it));
        this.hellos.put("kur", Integer.valueOf(R.string.ku));
        this.hellos.put("lat", Integer.valueOf(R.string.la));
        this.hellos.put("mkd", Integer.valueOf(R.string.mk));
        this.hellos.put("nor", Integer.valueOf(R.string.no));
        this.hellos.put("pol", Integer.valueOf(R.string.pl));
        this.hellos.put("por", Integer.valueOf(R.string.pt));
        this.hellos.put("ron", Integer.valueOf(R.string.ro));
        this.hellos.put("rus", Integer.valueOf(R.string.ru));
        this.hellos.put("srp", Integer.valueOf(R.string.sr));
        this.hellos.put("slk", Integer.valueOf(R.string.sk));
        this.hellos.put("spa", Integer.valueOf(R.string.es));
        this.hellos.put("spa-MEX", Integer.valueOf(R.string.esrMX));
        this.hellos.put("swe", Integer.valueOf(R.string.sw));
        this.hellos.put("swe", Integer.valueOf(R.string.sv));
        this.hellos.put("tam", Integer.valueOf(R.string.ta));
        this.hellos.put("tur", Integer.valueOf(R.string.tr));
        this.hellos.put("vie", Integer.valueOf(R.string.vi));
        this.hellos.put("cym", Integer.valueOf(R.string.cy));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sayHello() {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        String engine = prefs.getString("engine_pref", "/data/data/com.google.tts/lib/libttspico.so");
        this.myTts.setEngine(engine);
        String languageCode = prefs.getString("lang_pref", "eng-USA");
        int rate = Integer.parseInt(prefs.getString("rate_pref", "140"));
        this.myTts.setLanguage(languageCode);
        this.myTts.setSpeechRate(rate);
        if (!this.hellos.containsKey(languageCode)) {
            languageCode = "eng-USA";
        }
        String hello = getString(this.hellos.get(languageCode).intValue());
        this.myTts.speak(hello, 0, null);
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        menu.add(0, R.string.tts_apps, 0, R.string.tts_apps).setIcon(android.R.drawable.ic_menu_search);
        menu.add(0, R.string.homepage, 0, R.string.homepage).setIcon(android.R.drawable.ic_menu_info_details);
        return super.onCreateOptionsMenu(menu);
    }

    @Override // android.preference.PreferenceActivity, android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        Intent i = new Intent();
        ComponentName comp = new ComponentName("com.android.browser", "com.android.browser.BrowserActivity");
        i.setComponent(comp);
        i.setAction("android.intent.action.VIEW");
        i.addCategory("android.intent.category.BROWSABLE");
        switch (item.getItemId()) {
            case R.string.tts_apps /* 2131165185 */:
                Uri uri = Uri.parse("http://eyes-free.googlecode.com/svn/trunk/documentation/tts_apps.html");
                i.setData(uri);
                startActivity(i);
                break;
            case R.string.homepage /* 2131165186 */:
                Uri uri2 = Uri.parse("http://eyes-free.googlecode.com/");
                i.setData(uri2);
                startActivity(i);
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // android.preference.PreferenceActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == TTS_VOICE_DATA_CHECK_CODE && resultCode != 1) {
            Intent intent = new Intent();
            intent.setAction(TextToSpeechBeta.Engine.ACTION_INSTALL_TTS_DATA);
            intent.setClassName(TextToSpeechBeta.Engine.DEFAULT_SYNTH, "com.svox.pico.DownloadVoiceData");
            startActivityForResult(intent, TTS_VOICE_DATA_INSTALL_CODE);
        }
    }

    @Override // android.preference.PreferenceActivity, android.app.ListActivity, android.app.Activity
    protected void onDestroy() {
        if (this.myTts != null) {
            this.myTts.shutdown();
        }
        super.onDestroy();
    }
}
