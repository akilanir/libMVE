.class public Lcom/google/tts/PrefsActivity;
.super Landroid/preference/PreferenceActivity;
.source "PrefsActivity.java"


# static fields
.field private static final TTS_VOICE_DATA_CHECK_CODE:I = 0x2a

.field private static final TTS_VOICE_DATA_INSTALL_CODE:I = 0x2b


# instance fields
.field private hellos:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private myTts:Lcom/google/tts/TTS;

.field private ttsInitListener:Lcom/google/tts/TTS$InitListener;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 40
    new-instance v0, Lcom/google/tts/PrefsActivity$1;

    invoke-direct {v0, p0}, Lcom/google/tts/PrefsActivity$1;-><init>(Lcom/google/tts/PrefsActivity;)V

    iput-object v0, p0, Lcom/google/tts/PrefsActivity;->ttsInitListener:Lcom/google/tts/TTS$InitListener;

    .line 26
    return-void
.end method

.method static synthetic access$0(Lcom/google/tts/PrefsActivity;)V
    .registers 1

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/google/tts/PrefsActivity;->loadEngines()V

    return-void
.end method

.method static synthetic access$1(Lcom/google/tts/PrefsActivity;)V
    .registers 1

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/google/tts/PrefsActivity;->loadHellos()V

    return-void
.end method

.method static synthetic access$2(Lcom/google/tts/PrefsActivity;)V
    .registers 1

    .prologue
    .line 137
    invoke-direct {p0}, Lcom/google/tts/PrefsActivity;->sayHello()V

    return-void
.end method

.method private loadEngines()V
    .registers 14

    .prologue
    const/4 v10, 0x0

    .line 56
    const-string v9, "engine_pref"

    invoke-virtual {p0, v9}, Lcom/google/tts/PrefsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    .line 58
    .local v2, "enginesPref":Landroid/preference/ListPreference;
    new-instance v5, Landroid/content/Intent;

    const-string v9, "android.intent.action.START_TTS_ENGINE"

    invoke-direct {v5, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 60
    .local v5, "intent":Landroid/content/Intent;
    new-array v1, v10, [Landroid/content/pm/ResolveInfo;

    .line 61
    .local v1, "enginesArray":[Landroid/content/pm/ResolveInfo;
    invoke-virtual {p0}, Lcom/google/tts/PrefsActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 62
    .local v6, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v6, v5, v10}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "enginesArray":[Landroid/content/pm/ResolveInfo;
    check-cast v1, [Landroid/content/pm/ResolveInfo;

    .line 64
    .restart local v1    # "enginesArray":[Landroid/content/pm/ResolveInfo;
    array-length v9, v1

    new-array v3, v9, [Ljava/lang/CharSequence;

    .line 65
    .local v3, "entries":[Ljava/lang/CharSequence;
    array-length v9, v1

    new-array v8, v9, [Ljava/lang/CharSequence;

    .line 66
    .local v8, "values":[Ljava/lang/CharSequence;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_27
    array-length v9, v1

    if-lt v4, v9, :cond_39

    .line 75
    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 76
    invoke-virtual {v2, v8}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 81
    new-instance v9, Lcom/google/tts/PrefsActivity$2;

    invoke-direct {v9, p0}, Lcom/google/tts/PrefsActivity$2;-><init>(Lcom/google/tts/PrefsActivity;)V

    invoke-virtual {v2, v9}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 94
    return-void

    .line 67
    :cond_39
    aget-object v9, v1, v4

    invoke-virtual {v9, v6}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v9

    aput-object v9, v3, v4

    .line 68
    aget-object v9, v1, v4

    iget-object v0, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 71
    .local v0, "aInfo":Landroid/content/pm/ActivityInfo;
    new-instance v9, Ljava/lang/StringBuilder;

    iget-object v10, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    iget-object v12, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, ""

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, ".so"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 72
    .local v7, "soFilename":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 73
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "/data/data/"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/lib/libtts"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    .line 66
    add-int/lit8 v4, v4, 0x1

    goto :goto_27
.end method

.method private loadHellos()V
    .registers 4

    .prologue
    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    .line 98
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "afr"

    const v2, 0x7f070003

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "bos"

    const v2, 0x7f070004

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "yue"

    const v2, 0x7f070005

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "cmn"

    const v2, 0x7f070006

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "hrv"

    const v2, 0x7f070007

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "ces"

    const v2, 0x7f070008

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "nld"

    const v2, 0x7f070009

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "eng-USA"

    const v2, 0x7f07000a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "eng-GBR"

    const v2, 0x7f07000b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "epo"

    const v2, 0x7f07000c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "fin"

    const v2, 0x7f07000d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "fra"

    const v2, 0x7f07000e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "deu"

    const v2, 0x7f07000f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "ell"

    const v2, 0x7f070010

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "hin"

    const v2, 0x7f070011

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "hun"

    const v2, 0x7f070012

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "isl"

    const v2, 0x7f070013

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "ind"

    const v2, 0x7f070014

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "ita"

    const v2, 0x7f070015

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "kur"

    const v2, 0x7f070016

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "lat"

    const v2, 0x7f070017

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "mkd"

    const v2, 0x7f070018

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "nor"

    const v2, 0x7f070019

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "pol"

    const v2, 0x7f07001a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "por"

    const v2, 0x7f07001b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "ron"

    const v2, 0x7f07001c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "rus"

    const v2, 0x7f07001d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "srp"

    const v2, 0x7f07001e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "slk"

    const v2, 0x7f07001f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "spa"

    const v2, 0x7f070020

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "spa-MEX"

    const v2, 0x7f070021

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "swe"

    const v2, 0x7f070022

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "swe"

    const v2, 0x7f070023

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "tam"

    const v2, 0x7f070024

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "tur"

    const v2, 0x7f070025

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "vie"

    const v2, 0x7f070026

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    const-string v1, "cym"

    const v2, 0x7f070027

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    return-void
.end method

.method private sayHello()V
    .registers 10

    .prologue
    .line 138
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 140
    .local v4, "prefs":Landroid/content/SharedPreferences;
    const-string v0, "/data/data/com.google.tts/lib/libttspico.so"

    .line 141
    .local v0, "DEFAULT_TTS_BINARY":Ljava/lang/String;
    const-string v6, "engine_pref"

    invoke-interface {v4, v6, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 142
    .local v1, "engine":Ljava/lang/String;
    iget-object v6, p0, Lcom/google/tts/PrefsActivity;->myTts:Lcom/google/tts/TTS;

    invoke-virtual {v6, v1}, Lcom/google/tts/TTS;->setEngine(Ljava/lang/String;)V

    .line 144
    const-string v6, "lang_pref"

    const-string v7, "eng-USA"

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 145
    .local v3, "languageCode":Ljava/lang/String;
    const-string v6, "rate_pref"

    const-string v7, "140"

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 147
    .local v5, "rate":I
    iget-object v6, p0, Lcom/google/tts/PrefsActivity;->myTts:Lcom/google/tts/TTS;

    invoke-virtual {v6, v3}, Lcom/google/tts/TTS;->setLanguage(Ljava/lang/String;)V

    .line 148
    iget-object v6, p0, Lcom/google/tts/PrefsActivity;->myTts:Lcom/google/tts/TTS;

    invoke-virtual {v6, v5}, Lcom/google/tts/TTS;->setSpeechRate(I)V

    .line 149
    iget-object v6, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_39

    .line 150
    const-string v3, "eng-USA"

    .line 152
    :cond_39
    iget-object v6, p0, Lcom/google/tts/PrefsActivity;->hellos:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/google/tts/PrefsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 153
    .local v2, "hello":Ljava/lang/String;
    iget-object v6, p0, Lcom/google/tts/PrefsActivity;->myTts:Lcom/google/tts/TTS;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v6, v2, v7, v8}, Lcom/google/tts/TTS;->speak(Ljava/lang/String;I[Ljava/lang/String;)V

    .line 154
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 191
    const/16 v1, 0x2a

    if-ne p1, v1, :cond_1d

    .line 192
    const/4 v1, 0x1

    if-eq p2, v1, :cond_1d

    .line 193
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 194
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.speech.tts.engine.INSTALL_TTS_DATA"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 195
    const-string v1, "com.svox.pico"

    const-string v2, "com.svox.pico.DownloadVoiceData"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 196
    const/16 v1, 0x2b

    invoke-virtual {p0, v0, v1}, Lcom/google/tts/PrefsActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 199
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1d
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 35
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/google/tts/PrefsActivity;->setVolumeControlStream(I)V

    .line 37
    new-instance v0, Lcom/google/tts/TTS;

    iget-object v1, p0, Lcom/google/tts/PrefsActivity;->ttsInitListener:Lcom/google/tts/TTS$InitListener;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lcom/google/tts/TTS;-><init>(Landroid/content/Context;Lcom/google/tts/TTS$InitListener;Z)V

    iput-object v0, p0, Lcom/google/tts/PrefsActivity;->myTts:Lcom/google/tts/TTS;

    .line 38
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 6
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const v3, 0x7f070002

    const v0, 0x7f070001

    const/4 v2, 0x0

    .line 159
    invoke-interface {p1, v2, v0, v2, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x108004f

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 160
    invoke-interface {p1, v2, v3, v2, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 161
    const v1, 0x1080041

    .line 160
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 162
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onDestroy()V
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->myTts:Lcom/google/tts/TTS;

    if-eqz v0, :cond_9

    .line 204
    iget-object v0, p0, Lcom/google/tts/PrefsActivity;->myTts:Lcom/google/tts/TTS;

    invoke-virtual {v0}, Lcom/google/tts/TTS;->shutdown()V

    .line 206
    :cond_9
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 207
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 7
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 167
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 169
    .local v1, "i":Landroid/content/Intent;
    new-instance v0, Landroid/content/ComponentName;

    const-string v3, "com.android.browser"

    const-string v4, "com.android.browser.BrowserActivity"

    invoke-direct {v0, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .local v0, "comp":Landroid/content/ComponentName;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 171
    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 172
    const-string v3, "android.intent.category.BROWSABLE"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 174
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    packed-switch v3, :pswitch_data_42

    .line 186
    :goto_22
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v3

    return v3

    .line 176
    :pswitch_27
    const-string v3, "http://eyes-free.googlecode.com/svn/trunk/documentation/tts_apps.html"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 177
    .local v2, "uri":Landroid/net/Uri;
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 178
    invoke-virtual {p0, v1}, Lcom/google/tts/PrefsActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_22

    .line 181
    .end local v2    # "uri":Landroid/net/Uri;
    :pswitch_34
    const-string v3, "http://eyes-free.googlecode.com/"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 182
    .restart local v2    # "uri":Landroid/net/Uri;
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 183
    invoke-virtual {p0, v1}, Lcom/google/tts/PrefsActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_22

    .line 174
    nop

    :pswitch_data_42
    .packed-switch 0x7f070001
        :pswitch_27
        :pswitch_34
    .end packed-switch
.end method
