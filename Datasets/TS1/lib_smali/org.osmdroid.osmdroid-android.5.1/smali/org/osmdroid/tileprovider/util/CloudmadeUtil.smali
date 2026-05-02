.class public Lorg/osmdroid/tileprovider/util/CloudmadeUtil;
.super Ljava/lang/Object;
.source "CloudmadeUtil.java"


# static fields
.field private static final CLOUDMADE_ID:Ljava/lang/String; = "CLOUDMADE_ID"

.field private static final CLOUDMADE_KEY:Ljava/lang/String; = "CLOUDMADE_KEY"

.field private static final CLOUDMADE_TOKEN:Ljava/lang/String; = "CLOUDMADE_TOKEN"

.field public static DEBUGMODE:Z

.field private static mAndroidId:Ljava/lang/String;

.field private static mKey:Ljava/lang/String;

.field private static mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

.field private static mToken:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-boolean v0, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->DEBUGMODE:Z

    .line 40
    const-string v0, "android_id"

    sput-object v0, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mAndroidId:Ljava/lang/String;

    .line 43
    const-string v0, ""

    sput-object v0, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mKey:Ljava/lang/String;

    .line 46
    const-string v0, ""

    sput-object v0, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCloudmadeKey()Ljava/lang/String;
    .registers 1

    .prologue
    .line 83
    sget-object v0, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mKey:Ljava/lang/String;

    return-object v0
.end method

.method public static getCloudmadeToken()Ljava/lang/String;
    .registers 11

    .prologue
    .line 102
    sget-object v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_db

    .line 103
    sget-object v8, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    monitor-enter v8

    .line 105
    :try_start_b
    sget-object v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_da

    .line 106
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "http://auth.cloudmade.com/token/"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v9, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mKey:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "?userid="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v9, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mAndroidId:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_33
    .catchall {:try_start_b .. :try_end_33} :catchall_10e

    move-result-object v4

    .line 108
    .local v4, "url":Ljava/lang/String;
    const/4 v5, 0x0

    .line 111
    .local v5, "urlConnection":Ljava/net/HttpURLConnection;
    :try_start_35
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 112
    .local v6, "urlToRequest":Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v5, v0

    .line 113
    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 114
    const-string v7, "POST"

    invoke-virtual {v5, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 115
    const-string v7, "Content-Type"

    const-string v9, "application/x-www-form-urlencoded"

    invoke-virtual {v5, v7, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    sget-object v7, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT:Ljava/lang/String;

    invoke-static {}, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->getUserAgentValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v7, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->connect()V

    .line 118
    sget-boolean v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->DEBUGMODE:Z

    if-eqz v7, :cond_7e

    .line 119
    const-string v7, "OsmDroid"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Response from Cloudmade auth: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :cond_7e
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    const/16 v9, 0xc8

    if-ne v7, v9, :cond_d5

    .line 122
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v7, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v9, 0x2000

    invoke-direct {v1, v7, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 126
    .local v1, "br":Ljava/io/BufferedReader;
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 127
    .local v3, "line":Ljava/lang/String;
    sget-boolean v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->DEBUGMODE:Z

    if-eqz v7, :cond_b6

    .line 128
    const-string v7, "OsmDroid"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "First line from Cloudmade auth: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    :cond_b6
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    sput-object v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    .line 131
    sget-object v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_de

    .line 132
    sget-object v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "CLOUDMADE_TOKEN"

    sget-object v10, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    invoke-interface {v7, v9, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 133
    sget-object v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 135
    const/4 v7, 0x0

    sput-object v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;
    :try_end_d5
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_d5} :catch_e6
    .catchall {:try_start_35 .. :try_end_d5} :catchall_107

    .line 143
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v3    # "line":Ljava/lang/String;
    :cond_d5
    :goto_d5
    if-eqz v5, :cond_da

    .line 145
    :try_start_d7
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_da
    .catch Ljava/lang/Exception; {:try_start_d7 .. :try_end_da} :catch_111
    .catchall {:try_start_d7 .. :try_end_da} :catchall_10e

    .line 150
    .end local v6    # "urlToRequest":Ljava/net/URL;
    :cond_da
    :goto_da
    :try_start_da
    monitor-exit v8
    :try_end_db
    .catchall {:try_start_da .. :try_end_db} :catchall_10e

    .line 153
    :cond_db
    sget-object v7, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    return-object v7

    .line 137
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v6    # "urlToRequest":Ljava/net/URL;
    :cond_de
    :try_start_de
    const-string v7, "OsmDroid"

    const-string v9, "No authorization token received from Cloudmade"

    invoke-static {v7, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e5
    .catch Ljava/io/IOException; {:try_start_de .. :try_end_e5} :catch_e6
    .catchall {:try_start_de .. :try_end_e5} :catchall_107

    goto :goto_d5

    .line 140
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v3    # "line":Ljava/lang/String;
    .end local v6    # "urlToRequest":Ljava/net/URL;
    :catch_e6
    move-exception v2

    .line 141
    .local v2, "e":Ljava/io/IOException;
    :try_start_e7
    const-string v7, "OsmDroid"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "No authorization token received from Cloudmade: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_ff
    .catchall {:try_start_e7 .. :try_end_ff} :catchall_107

    .line 143
    if-eqz v5, :cond_da

    .line 145
    :try_start_101
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_104
    .catch Ljava/lang/Exception; {:try_start_101 .. :try_end_104} :catch_105
    .catchall {:try_start_101 .. :try_end_104} :catchall_10e

    goto :goto_da

    .line 147
    :catch_105
    move-exception v7

    goto :goto_da

    .line 143
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_107
    move-exception v7

    if-eqz v5, :cond_10d

    .line 145
    :try_start_10a
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_10d
    .catch Ljava/lang/Exception; {:try_start_10a .. :try_end_10d} :catch_113
    .catchall {:try_start_10a .. :try_end_10d} :catchall_10e

    .line 147
    :cond_10d
    :goto_10d
    :try_start_10d
    throw v7

    .line 150
    :catchall_10e
    move-exception v7

    monitor-exit v8
    :try_end_110
    .catchall {:try_start_10d .. :try_end_110} :catchall_10e

    throw v7

    .line 147
    .restart local v6    # "urlToRequest":Ljava/net/URL;
    :catch_111
    move-exception v7

    goto :goto_da

    .end local v6    # "urlToRequest":Ljava/net/URL;
    :catch_113
    move-exception v9

    goto :goto_10d
.end method

.method public static retrieveCloudmadeKey(Landroid/content/Context;)V
    .registers 6
    .param p0, "aContext"    # Landroid/content/Context;

    .prologue
    .line 55
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mAndroidId:Ljava/lang/String;

    .line 58
    const-string v2, "CLOUDMADE_KEY"

    invoke-static {p0, v2}, Lorg/osmdroid/tileprovider/util/ManifestUtil;->retrieveKey(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mKey:Ljava/lang/String;

    .line 61
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 62
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    sput-object v2, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    .line 63
    const-string v2, "CLOUDMADE_ID"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "id":Ljava/lang/String;
    sget-object v2, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mAndroidId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_44

    .line 65
    const-string v2, "CLOUDMADE_TOKEN"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    .line 67
    sget-object v2, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mToken:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_43

    .line 68
    const/4 v2, 0x0

    sput-object v2, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    .line 75
    :cond_43
    :goto_43
    return-void

    .line 71
    :cond_44
    sget-object v2, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    const-string v3, "CLOUDMADE_ID"

    sget-object v4, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mAndroidId:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 72
    sget-object v2, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mPreferenceEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_43
.end method

.method public static setCloudmadeKey(Ljava/lang/String;)V
    .registers 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 92
    sput-object p0, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->mKey:Ljava/lang/String;

    .line 93
    return-void
.end method
