.class public Lorg/openintents/openpgp/util/OpenPgpKeyPreference;
.super Landroid/preference/Preference;
.source "OpenPgpKeyPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;,
        Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;
    }
.end annotation


# static fields
.field private static final NO_KEY:I = 0x0

.field public static final REQUEST_CODE_KEY_PREFERENCE:I = 0x270f


# instance fields
.field private mDefaultUserId:Ljava/lang/String;

.field private mKeyId:J

.field private mOpenPgpProvider:Ljava/lang/String;

.field private mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    return-void
.end method

.method static synthetic access$000(Lorg/openintents/openpgp/util/OpenPgpKeyPreference;Landroid/content/Intent;)V
    .registers 2
    .param p0, "x0"    # Lorg/openintents/openpgp/util/OpenPgpKeyPreference;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->getSignKeyId(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$200(Lorg/openintents/openpgp/util/OpenPgpKeyPreference;J)V
    .registers 3
    .param p0, "x0"    # Lorg/openintents/openpgp/util/OpenPgpKeyPreference;
    .param p1, "x1"    # J

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->save(J)V

    return-void
.end method

.method private getSignKeyId(Landroid/content/Intent;)V
    .registers 6
    .param p1, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 96
    const-string v1, "org.openintents.openpgp.action.GET_SIGN_KEY_ID"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 97
    const-string v1, "user_id"

    iget-object v2, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mDefaultUserId:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 99
    new-instance v0, Lorg/openintents/openpgp/util/OpenPgpApi;

    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v2}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService2;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService2;)V

    .line 100
    .local v0, "api":Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v1, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;

    const/16 v2, 0x270f

    invoke-direct {v1, p0, v2, v3}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback;-><init>(Lorg/openintents/openpgp/util/OpenPgpKeyPreference;ILorg/openintents/openpgp/util/OpenPgpKeyPreference$1;)V

    invoke-virtual {v0, p1, v3, v3, v1}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V

    .line 101
    return-void
.end method

.method private save(J)V
    .registers 4
    .param p1, "newValue"    # J

    .prologue
    .line 146
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 152
    :goto_a
    return-void

    .line 151
    :cond_b
    invoke-direct {p0, p1, p2}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->setAndPersist(J)V

    goto :goto_a
.end method

.method private setAndPersist(J)V
    .registers 5
    .param p1, "newValue"    # J

    .prologue
    .line 169
    iput-wide p1, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mKeyId:J

    .line 173
    iget-wide v0, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mKeyId:J

    invoke-virtual {p0, v0, v1}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->persistLong(J)Z

    .line 176
    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->notifyChanged()V

    .line 179
    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 180
    return-void
.end method

.method private updateEnabled()V
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mOpenPgpProvider:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 58
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->setEnabled(Z)V

    .line 62
    :goto_c
    return-void

    .line 60
    :cond_d
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->setEnabled(Z)V

    goto :goto_c
.end method


# virtual methods
.method public getSummary()Ljava/lang/CharSequence;
    .registers 5

    .prologue
    .line 52
    iget-wide v0, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mKeyId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_13

    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lorg/openintents/openpgp/R$string;->openpgp_no_key_selected:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_12
    return-object v0

    :cond_13
    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lorg/openintents/openpgp/R$string;->openpgp_key_selected:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_12
.end method

.method public getValue()J
    .registers 3

    .prologue
    .line 165
    iget-wide v0, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mKeyId:J

    return-wide v0
.end method

.method public handleOnActivityResult(IILandroid/content/Intent;)Z
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 285
    const/16 v0, 0x270f

    if-ne p1, v0, :cond_c

    const/4 v0, -0x1

    if-ne p2, v0, :cond_c

    .line 286
    invoke-direct {p0, p3}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->getSignKeyId(Landroid/content/Intent;)V

    .line 287
    const/4 v0, 0x1

    .line 289
    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected onClick()V
    .registers 5

    .prologue
    .line 76
    new-instance v0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mOpenPgpProvider:Ljava/lang/String;

    new-instance v3, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$1;

    invoke-direct {v3, p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$1;-><init>(Lorg/openintents/openpgp/util/OpenPgpKeyPreference;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;)V

    iput-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    .line 92
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->bindToService()V

    .line 93
    return-void
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I

    .prologue
    .line 186
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 225
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    .line 227
    invoke-super {p0, p1}, Landroid/preference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 238
    :goto_f
    return-void

    :cond_10
    move-object v0, p1

    .line 232
    check-cast v0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;

    .line 233
    .local v0, "myState":Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;
    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 234
    iget-wide v1, v0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;->keyId:J

    iput-wide v1, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mKeyId:J

    .line 235
    iget-object v1, v0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;->openPgpProvider:Ljava/lang/String;

    iput-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mOpenPgpProvider:Ljava/lang/String;

    .line 236
    iget-object v1, v0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;->defaultUserId:Ljava/lang/String;

    iput-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mDefaultUserId:Ljava/lang/String;

    .line 237
    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->notifyChanged()V

    goto :goto_f
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 209
    invoke-super {p0}, Landroid/preference/Preference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 210
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 220
    .end local v1    # "superState":Landroid/os/Parcelable;
    :goto_a
    return-object v1

    .line 216
    .restart local v1    # "superState":Landroid/os/Parcelable;
    :cond_b
    new-instance v0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;

    invoke-direct {v0, v1}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 217
    .local v0, "myState":Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;
    iget-wide v2, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mKeyId:J

    iput-wide v2, v0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;->keyId:J

    .line 218
    iget-object v2, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mOpenPgpProvider:Ljava/lang/String;

    iput-object v2, v0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;->openPgpProvider:Ljava/lang/String;

    .line 219
    iget-object v2, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mDefaultUserId:Ljava/lang/String;

    iput-object v2, v0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference$SavedState;->defaultUserId:Ljava/lang/String;

    move-object v1, v0

    .line 220
    goto :goto_a
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .registers 7
    .param p1, "restoreValue"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 191
    if-eqz p1, :cond_b

    .line 193
    iget-wide v2, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mKeyId:J

    invoke-virtual {p0, v2, v3}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->getPersistedLong(J)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mKeyId:J

    .line 199
    .end local p2    # "defaultValue":Ljava/lang/Object;
    :goto_a
    return-void

    .line 196
    .restart local p2    # "defaultValue":Ljava/lang/Object;
    :cond_b
    check-cast p2, Ljava/lang/Long;

    .end local p2    # "defaultValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 197
    .local v0, "value":J
    invoke-direct {p0, v0, v1}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->setAndPersist(J)V

    goto :goto_a
.end method

.method public setDefaultUserId(Ljava/lang/String;)V
    .registers 2
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mDefaultUserId:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setOpenPgpProvider(Ljava/lang/String;)V
    .registers 2
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->mOpenPgpProvider:Ljava/lang/String;

    .line 66
    invoke-direct {p0}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->updateEnabled()V

    .line 67
    return-void
.end method

.method public setValue(J)V
    .registers 3
    .param p1, "keyId"    # J

    .prologue
    .line 158
    invoke-direct {p0, p1, p2}, Lorg/openintents/openpgp/util/OpenPgpKeyPreference;->setAndPersist(J)V

    .line 159
    return-void
.end method
