.class public abstract Lcom/google/tts/ITtsBeta$Stub;
.super Landroid/os/Binder;
.source "ITtsBeta.java"

# interfaces
.implements Lcom/google/tts/ITtsBeta;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/tts/ITtsBeta;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/tts/ITtsBeta$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.google.tts.ITtsBeta"

.field static final TRANSACTION_addEarcon:I = 0xd

.field static final TRANSACTION_addEarconFile:I = 0xe

.field static final TRANSACTION_addSpeech:I = 0x6

.field static final TRANSACTION_addSpeechFile:I = 0x7

.field static final TRANSACTION_getLanguage:I = 0x8

.field static final TRANSACTION_isLanguageAvailable:I = 0x9

.field static final TRANSACTION_isSpeaking:I = 0x4

.field static final TRANSACTION_playEarcon:I = 0xc

.field static final TRANSACTION_playSilence:I = 0x11

.field static final TRANSACTION_registerCallback:I = 0xf

.field static final TRANSACTION_setLanguage:I = 0xa

.field static final TRANSACTION_setPitch:I = 0x2

.field static final TRANSACTION_setSpeechRate:I = 0x1

.field static final TRANSACTION_speak:I = 0x3

.field static final TRANSACTION_stop:I = 0x5

.field static final TRANSACTION_synthesizeToFile:I = 0xb

.field static final TRANSACTION_unregisterCallback:I = 0x10


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 27
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p0, p0, v0}, Lcom/google/tts/ITtsBeta$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 28
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/google/tts/ITtsBeta;
    .registers 3
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    .line 35
    if-nez p0, :cond_4

    .line 36
    const/4 v0, 0x0

    .line 42
    :goto_3
    return-object v0

    .line 38
    :cond_4
    const-string v1, "com.google.tts.ITtsBeta"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 39
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_13

    instance-of v1, v0, Lcom/google/tts/ITtsBeta;

    if-eqz v1, :cond_13

    .line 40
    check-cast v0, Lcom/google/tts/ITtsBeta;

    goto :goto_3

    .line 42
    :cond_13
    new-instance v0, Lcom/google/tts/ITtsBeta$Stub$Proxy;

    .end local v0    # "iin":Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/google/tts/ITtsBeta$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_3
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    .prologue
    .line 46
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 14
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v7, 0x1

    .line 50
    sparse-switch p1, :sswitch_data_1e4

    .line 282
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v7

    :goto_9
    return v7

    .line 54
    :sswitch_a
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_9

    .line 59
    :sswitch_10
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 63
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 64
    .local v2, "_arg1":I
    invoke-virtual {p0, v1, v2}, Lcom/google/tts/ITtsBeta$Stub;->setSpeechRate(Ljava/lang/String;I)I

    move-result v6

    .line 65
    .local v6, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 66
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_9

    .line 71
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":I
    .end local v6    # "_result":I
    :sswitch_28
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 75
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 76
    .restart local v2    # "_arg1":I
    invoke-virtual {p0, v1, v2}, Lcom/google/tts/ITtsBeta$Stub;->setPitch(Ljava/lang/String;I)I

    move-result v6

    .line 77
    .restart local v6    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 78
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_9

    .line 83
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":I
    .end local v6    # "_result":I
    :sswitch_40
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 87
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 91
    .local v4, "_arg2":I
    invoke-virtual {p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v5

    .line 92
    .local v5, "_arg3":[Ljava/lang/String;
    invoke-virtual {p0, v1, v2, v4, v5}, Lcom/google/tts/ITtsBeta$Stub;->speak(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)I

    move-result v6

    .line 93
    .restart local v6    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 94
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_9

    .line 99
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":I
    .end local v5    # "_arg3":[Ljava/lang/String;
    .end local v6    # "_result":I
    :sswitch_60
    const-string v8, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v8}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p0}, Lcom/google/tts/ITtsBeta$Stub;->isSpeaking()Z

    move-result v6

    .line 101
    .local v6, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 102
    if-eqz v6, :cond_6f

    move v0, v7

    :cond_6f
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_9

    .line 107
    .end local v6    # "_result":Z
    :sswitch_73
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 109
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 110
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/google/tts/ITtsBeta$Stub;->stop(Ljava/lang/String;)I

    move-result v6

    .line 111
    .local v6, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 112
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_9

    .line 117
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v6    # "_result":I
    :sswitch_87
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 119
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 121
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 123
    .restart local v2    # "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 125
    .local v4, "_arg2":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 126
    .local v5, "_arg3":I
    invoke-virtual {p0, v1, v2, v4, v5}, Lcom/google/tts/ITtsBeta$Stub;->addSpeech(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 127
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_9

    .line 132
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":Ljava/lang/String;
    .end local v5    # "_arg3":I
    :sswitch_a4
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 136
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 138
    .restart local v2    # "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 139
    .restart local v4    # "_arg2":Ljava/lang/String;
    invoke-virtual {p0, v1, v2, v4}, Lcom/google/tts/ITtsBeta$Stub;->addSpeechFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_9

    .line 145
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":Ljava/lang/String;
    :sswitch_bd
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 146
    invoke-virtual {p0}, Lcom/google/tts/ITtsBeta$Stub;->getLanguage()[Ljava/lang/String;

    move-result-object v6

    .line 147
    .local v6, "_result":[Ljava/lang/String;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 148
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    goto/16 :goto_9

    .line 153
    .end local v6    # "_result":[Ljava/lang/String;
    :sswitch_ce
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 155
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 157
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 159
    .restart local v2    # "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 160
    .restart local v4    # "_arg2":Ljava/lang/String;
    invoke-virtual {p0, v1, v2, v4}, Lcom/google/tts/ITtsBeta$Stub;->isLanguageAvailable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 161
    .local v6, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 162
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_9

    .line 167
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":Ljava/lang/String;
    .end local v6    # "_result":I
    :sswitch_eb
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 169
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 171
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 173
    .restart local v2    # "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 175
    .restart local v4    # "_arg2":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    .line 176
    .local v5, "_arg3":Ljava/lang/String;
    invoke-virtual {p0, v1, v2, v4, v5}, Lcom/google/tts/ITtsBeta$Stub;->setLanguage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 177
    .restart local v6    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 178
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_9

    .line 183
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":Ljava/lang/String;
    .end local v5    # "_arg3":Ljava/lang/String;
    .end local v6    # "_result":I
    :sswitch_10c
    const-string v8, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v8}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 185
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 187
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 189
    .restart local v2    # "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v4

    .line 191
    .local v4, "_arg2":[Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    .line 192
    .restart local v5    # "_arg3":Ljava/lang/String;
    invoke-virtual {p0, v1, v2, v4, v5}, Lcom/google/tts/ITtsBeta$Stub;->synthesizeToFile(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    .line 193
    .local v6, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 194
    if-eqz v6, :cond_12b

    move v0, v7

    :cond_12b
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_9

    .line 199
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":[Ljava/lang/String;
    .end local v5    # "_arg3":Ljava/lang/String;
    .end local v6    # "_result":Z
    :sswitch_130
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 201
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 203
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 205
    .restart local v2    # "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 207
    .local v4, "_arg2":I
    invoke-virtual {p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v5

    .line 208
    .local v5, "_arg3":[Ljava/lang/String;
    invoke-virtual {p0, v1, v2, v4, v5}, Lcom/google/tts/ITtsBeta$Stub;->playEarcon(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)I

    move-result v6

    .line 209
    .local v6, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 210
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_9

    .line 215
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":I
    .end local v5    # "_arg3":[Ljava/lang/String;
    .end local v6    # "_result":I
    :sswitch_151
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 217
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 219
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 221
    .restart local v2    # "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 223
    .local v4, "_arg2":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 224
    .local v5, "_arg3":I
    invoke-virtual {p0, v1, v2, v4, v5}, Lcom/google/tts/ITtsBeta$Stub;->addEarcon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 225
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_9

    .line 230
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":Ljava/lang/String;
    .end local v5    # "_arg3":I
    :sswitch_16e
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 232
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 234
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 236
    .restart local v2    # "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 237
    .restart local v4    # "_arg2":Ljava/lang/String;
    invoke-virtual {p0, v1, v2, v4}, Lcom/google/tts/ITtsBeta$Stub;->addEarconFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_9

    .line 243
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":Ljava/lang/String;
    :sswitch_187
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 245
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 247
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/google/tts/ITtsCallbackBeta$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/tts/ITtsCallbackBeta;

    move-result-object v2

    .line 248
    .local v2, "_arg1":Lcom/google/tts/ITtsCallbackBeta;
    invoke-virtual {p0, v1, v2}, Lcom/google/tts/ITtsBeta$Stub;->registerCallback(Ljava/lang/String;Lcom/google/tts/ITtsCallbackBeta;)I

    move-result v6

    .line 249
    .restart local v6    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 250
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_9

    .line 255
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Lcom/google/tts/ITtsCallbackBeta;
    .end local v6    # "_result":I
    :sswitch_1a4
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 257
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 259
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/google/tts/ITtsCallbackBeta$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/tts/ITtsCallbackBeta;

    move-result-object v2

    .line 260
    .restart local v2    # "_arg1":Lcom/google/tts/ITtsCallbackBeta;
    invoke-virtual {p0, v1, v2}, Lcom/google/tts/ITtsBeta$Stub;->unregisterCallback(Ljava/lang/String;Lcom/google/tts/ITtsCallbackBeta;)I

    move-result v6

    .line 261
    .restart local v6    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 262
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_9

    .line 267
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Lcom/google/tts/ITtsCallbackBeta;
    .end local v6    # "_result":I
    :sswitch_1c1
    const-string v0, "com.google.tts.ITtsBeta"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 269
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 271
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    .line 273
    .local v2, "_arg1":J
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 275
    .local v4, "_arg2":I
    invoke-virtual {p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v5

    .local v5, "_arg3":[Ljava/lang/String;
    move-object v0, p0

    .line 276
    invoke-virtual/range {v0 .. v5}, Lcom/google/tts/ITtsBeta$Stub;->playSilence(Ljava/lang/String;JI[Ljava/lang/String;)I

    move-result v6

    .line 277
    .restart local v6    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 278
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_9

    .line 50
    nop

    :sswitch_data_1e4
    .sparse-switch
        0x1 -> :sswitch_10
        0x2 -> :sswitch_28
        0x3 -> :sswitch_40
        0x4 -> :sswitch_60
        0x5 -> :sswitch_73
        0x6 -> :sswitch_87
        0x7 -> :sswitch_a4
        0x8 -> :sswitch_bd
        0x9 -> :sswitch_ce
        0xa -> :sswitch_eb
        0xb -> :sswitch_10c
        0xc -> :sswitch_130
        0xd -> :sswitch_151
        0xe -> :sswitch_16e
        0xf -> :sswitch_187
        0x10 -> :sswitch_1a4
        0x11 -> :sswitch_1c1
        0x5f4e5446 -> :sswitch_a
    .end sparse-switch
.end method
