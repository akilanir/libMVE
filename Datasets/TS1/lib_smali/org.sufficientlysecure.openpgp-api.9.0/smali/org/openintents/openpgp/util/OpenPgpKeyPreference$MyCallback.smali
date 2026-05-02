.class Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;
.super Ljava/lang/Object;
.source "OpenPgpKeyPreference.java"

# interfaces
.implements Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/util/OpenPgpKeyPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyCallback"
.end annotation


# instance fields
.field requestCode:I

.field final synthetic this$0:Lorg/openintents/openpgp/util/OpenPgpKeyPreference;


# direct methods
.method private constructor <init>(Lorg/openintents/openpgp/util/OpenPgpKeyPreference;I)V
    .registers 3
    .param p2, "requestCode"    # I

    .prologue
    .line 106
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;->this$0:Lorg/openintents/openpgp/util/OpenPgpKeyPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput p2, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;->requestCode:I

    .line 108
    return-void
.end method

.method synthetic constructor <init>(Lorg/openintents/openpgp/util/OpenPgpKeyPreference;ILorg/openintents/openpgp/util/OpenPgpKeyPreference$1;)V
    .registers 4
    .param p1, "x0"    # Lorg/openintents/openpgp/util/OpenPgpKeyPreference;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lorg/openintents/openpgp/util/OpenPgpKeyPreference$1;

    .prologue
    .line 103
    invoke-direct {p0, p1, p2}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;-><init>(Lorg/openintents/openpgp/util/OpenPgpKeyPreference;I)V

    return-void
.end method


# virtual methods
.method public onReturn(Landroid/content/Intent;)V
    .registers 15
    .param p1, "result"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 112
    const-string v1, "result_code"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    packed-switch v1, :pswitch_data_66

    .line 140
    :goto_a
    return-void

    .line 115
    :pswitch_b
    const-string v1, "sign_key_id"

    const-wide/16 v2, 0x0

    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v10

    .line 116
    .local v10, "keyId":J
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;->this$0:Lorg/openintents/openpgp/util/OpenPgpKeyPreference;

    # invokes: Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->save(J)V
    invoke-static {v1, v10, v11}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->access$200(Lorg/openintents/openpgp/util/OpenPgpKeyPreference;J)V

    goto :goto_a

    .line 122
    .end local v10    # "keyId":J
    :pswitch_19
    const-string v1, "intent"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v12

    check-cast v12, Landroid/app/PendingIntent;

    .line 124
    .local v12, "pi":Landroid/app/PendingIntent;
    :try_start_21
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;->this$0:Lorg/openintents/openpgp/util/OpenPgpKeyPreference;

    invoke-virtual {v1}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 125
    .local v0, "act":Landroid/app/Activity;
    invoke-virtual {v12}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v2

    iget v3, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;->requestCode:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, v0

    invoke-virtual/range {v0 .. v7}, Landroid/app/Activity;->startIntentSenderFromChild(Landroid/app/Activity;Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_37
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_21 .. :try_end_37} :catch_38

    goto :goto_a

    .line 128
    .end local v0    # "act":Landroid/app/Activity;
    :catch_38
    move-exception v8

    .line 129
    .local v8, "e":Landroid/content/IntentSender$SendIntentException;
    const-string v1, "OpenPgp API"

    const-string v2, "SendIntentException"

    invoke-static {v1, v2, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a

    .line 134
    .end local v8    # "e":Landroid/content/IntentSender$SendIntentException;
    .end local v12    # "pi":Landroid/app/PendingIntent;
    :pswitch_41
    const-string v1, "error"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v9

    check-cast v9, Lorg/openintents/openpgp/OpenPgpError;

    .line 135
    .local v9, "error":Lorg/openintents/openpgp/OpenPgpError;
    const-string v1, "OpenPgp API"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RESULT_CODE_ERROR: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Lorg/openintents/openpgp/OpenPgpError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 112
    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_41
        :pswitch_b
        :pswitch_19
    .end packed-switch
.end method
