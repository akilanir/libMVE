.class public Linfo/guardianproject/netcipher/proxy/OrbotHelper;
.super Ljava/lang/Object;
.source "OrbotHelper.java"


# static fields
.field public static final ACTION_REQUEST_HS:Ljava/lang/String; = "org.torproject.android.REQUEST_HS_PORT"

.field public static final ACTION_START:Ljava/lang/String; = "org.torproject.android.intent.action.START"

.field public static final ACTION_START_TOR:Ljava/lang/String; = "org.torproject.android.START_TOR"

.field public static final ACTION_STATUS:Ljava/lang/String; = "org.torproject.android.intent.action.STATUS"

.field public static final EXTRA_PACKAGE_NAME:Ljava/lang/String; = "org.torproject.android.intent.extra.PACKAGE_NAME"

.field public static final EXTRA_STATUS:Ljava/lang/String; = "org.torproject.android.intent.extra.STATUS"

.field private static final FDROID_PACKAGE_NAME:Ljava/lang/String; = "org.fdroid.fdroid"

.field public static final HS_REQUEST_CODE:I = 0x270f

.field public static final ORBOT_FDROID_URI:Ljava/lang/String; = "https://f-droid.org/repository/browse/?fdid=org.torproject.android"

.field public static final ORBOT_MARKET_URI:Ljava/lang/String; = "market://details?id=org.torproject.android"

.field public static final ORBOT_PACKAGE_NAME:Ljava/lang/String; = "org.torproject.android"

.field public static final ORBOT_PLAY_URI:Ljava/lang/String; = "https://play.google.com/store/apps/details?id=org.torproject.android"

.field private static final PLAY_PACKAGE_NAME:Ljava/lang/String; = "com.android.vending"

.field private static final REQUEST_CODE_STATUS:I = 0x64

.field public static final START_TOR_RESULT:I = 0x9234

.field public static final STATUS_OFF:Ljava/lang/String; = "OFF"

.field public static final STATUS_ON:Ljava/lang/String; = "ON"

.field public static final STATUS_STARTING:Ljava/lang/String; = "STARTING"

.field public static final STATUS_STARTS_DISABLED:Ljava/lang/String; = "STARTS_DISABLED"

.field public static final STATUS_STOPPING:Ljava/lang/String; = "STOPPING"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    return-void
.end method

.method public static getOrbotInstallIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 214
    new-instance v2, Landroid/content/Intent;

    const-string v6, "android.intent.action.VIEW"

    invoke-direct {v2, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 215
    .local v2, "intent":Landroid/content/Intent;
    const-string v6, "market://details?id=org.torproject.android"

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 217
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 218
    .local v3, "pm":Landroid/content/pm/PackageManager;
    const/4 v6, 0x0

    invoke-virtual {v3, v2, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v5

    .line 220
    .local v5, "resInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const/4 v0, 0x0

    .line 221
    .local v0, "foundPackageName":Ljava/lang/String;
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_62

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 222
    .local v4, "r":Landroid/content/pm/ResolveInfo;
    const-string v6, "OrbotHelper"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "market: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const-string v7, "org.fdroid.fdroid"

    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_5e

    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const-string v7, "com.android.vending"

    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1e

    .line 225
    :cond_5e
    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 230
    .end local v4    # "r":Landroid/content/pm/ResolveInfo;
    :cond_62
    if-nez v0, :cond_6e

    .line 231
    const-string v6, "https://f-droid.org/repository/browse/?fdid=org.torproject.android"

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 235
    :goto_6d
    return-object v2

    .line 233
    :cond_6e
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_6d
.end method

.method public static getOrbotStartIntent()Landroid/content/Intent;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 178
    new-instance v0, Landroid/content/Intent;

    const-string v1, "org.torproject.android.intent.action.START"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 179
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "org.torproject.android"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 180
    return-object v0
.end method

.method public static getOrbotStartIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 166
    new-instance v0, Landroid/content/Intent;

    const-string v1, "org.torproject.android.intent.action.START"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 167
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "org.torproject.android"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 168
    const-string v1, "org.torproject.android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 169
    return-object v0
.end method

.method public static getShowOrbotStartIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 207
    new-instance v0, Landroid/content/Intent;

    const-string v1, "org.torproject.android.START_TOR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 208
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "org.torproject.android"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 209
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 210
    return-object v0
.end method

.method private static isAppInstalled(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 122
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 123
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const/4 v3, 0x1

    invoke-virtual {v1, p1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_9
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_9} :catch_a

    .line 126
    .end local v1    # "pm":Landroid/content/pm/PackageManager;
    :goto_9
    return v2

    .line 125
    :catch_a
    move-exception v0

    .line 126
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v2, 0x0

    goto :goto_9
.end method

.method public static isOnionAddress(Landroid/net/Uri;)Z
    .registers 3
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 107
    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".onion"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isOnionAddress(Ljava/lang/String;)Z
    .registers 3
    .param p0, "urlString"    # Ljava/lang/String;

    .prologue
    .line 94
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Linfo/guardianproject/netcipher/proxy/OrbotHelper;->isOnionAddress(Ljava/net/URL;)Z
    :try_end_8
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_8} :catch_a

    move-result v1

    .line 96
    :goto_9
    return v1

    .line 95
    :catch_a
    move-exception v0

    .line 96
    .local v0, "e":Ljava/net/MalformedURLException;
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public static isOnionAddress(Ljava/net/URL;)Z
    .registers 3
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 83
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".onion"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isOrbotInstalled(Landroid/content/Context;)Z
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 117
    const-string v0, "org.torproject.android"

    invoke-static {p0, v0}, Linfo/guardianproject/netcipher/proxy/OrbotHelper;->isAppInstalled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isOrbotRunning(Landroid/content/Context;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 111
    invoke-static {p0}, Linfo/guardianproject/netcipher/proxy/TorServiceUtils;->findProcessId(Landroid/content/Context;)I

    move-result v0

    .line 113
    .local v0, "procId":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    const/4 v1, 0x1

    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public static requestHiddenServiceOnPort(Landroid/app/Activity;I)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "port"    # I

    .prologue
    .line 131
    new-instance v0, Landroid/content/Intent;

    const-string v1, "org.torproject.android.REQUEST_HS_PORT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 132
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "org.torproject.android"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 133
    const-string v1, "hs_port"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 135
    const/16 v1, 0x270f

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 136
    return-void
.end method

.method public static requestShowOrbotStart(Landroid/app/Activity;)Z
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 196
    invoke-static {p0}, Linfo/guardianproject/netcipher/proxy/OrbotHelper;->isOrbotInstalled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 197
    invoke-static {p0}, Linfo/guardianproject/netcipher/proxy/OrbotHelper;->isOrbotRunning(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 198
    invoke-static {}, Linfo/guardianproject/netcipher/proxy/OrbotHelper;->getShowOrbotStartIntent()Landroid/content/Intent;

    move-result-object v0

    .line 199
    .local v0, "intent":Landroid/content/Intent;
    const v1, 0x9234

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 200
    const/4 v1, 0x1

    .line 203
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public static requestStartTor(Landroid/content/Context;)Z
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 151
    invoke-static {p0}, Linfo/guardianproject/netcipher/proxy/OrbotHelper;->isOrbotInstalled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 152
    const-string v1, "OrbotHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestStartTor "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    invoke-static {p0}, Linfo/guardianproject/netcipher/proxy/OrbotHelper;->getOrbotStartIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    .line 154
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 155
    const/4 v1, 0x1

    .line 157
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_2a
    return v1

    :cond_2b
    const/4 v1, 0x0

    goto :goto_2a
.end method
