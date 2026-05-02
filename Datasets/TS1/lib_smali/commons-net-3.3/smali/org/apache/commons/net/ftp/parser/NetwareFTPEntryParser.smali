.class public Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;
.super Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;
.source "NetwareFTPEntryParser.java"


# static fields
.field private static final DEFAULT_DATE_FORMAT:Ljava/lang/String; = "MMM dd yyyy"

.field private static final DEFAULT_RECENT_DATE_FORMAT:Ljava/lang/String; = "MMM dd HH:mm"

.field private static final REGEX:Ljava/lang/String; = "(d|-){1}\\s+\\[(.*)\\]\\s+(\\S+)\\s+(\\d+)\\s+(\\S+\\s+\\S+\\s+((\\d+:\\d+)|(\\d{4})))\\s+(.*)"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;-><init>(Lorg/apache/commons/net/ftp/FTPClientConfig;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/net/ftp/FTPClientConfig;)V
    .registers 3
    .param p1, "config"    # Lorg/apache/commons/net/ftp/FTPClientConfig;

    .prologue
    .line 83
    const-string v0, "(d|-){1}\\s+\\[(.*)\\]\\s+(\\S+)\\s+(\\d+)\\s+(\\S+\\s+\\S+\\s+((\\d+:\\d+)|(\\d{4})))\\s+(.*)"

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;-><init>(Ljava/lang/String;)V

    .line 84
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;->configure(Lorg/apache/commons/net/ftp/FTPClientConfig;)V

    .line 85
    return-void
.end method


# virtual methods
.method protected getDefaultConfiguration()Lorg/apache/commons/net/ftp/FTPClientConfig;
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 172
    new-instance v0, Lorg/apache/commons/net/ftp/FTPClientConfig;

    const-string v1, "NETWARE"

    const-string v2, "MMM dd yyyy"

    const-string v3, "MMM dd HH:mm"

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/net/ftp/FTPClientConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public parseFTPEntry(Ljava/lang/String;)Lorg/apache/commons/net/ftp/FTPFile;
    .registers 14
    .param p1, "entry"    # Ljava/lang/String;

    .prologue
    const/4 v11, -0x1

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 116
    new-instance v3, Lorg/apache/commons/net/ftp/FTPFile;

    invoke-direct {v3}, Lorg/apache/commons/net/ftp/FTPFile;-><init>()V

    .line 117
    .local v3, "f":Lorg/apache/commons/net/ftp/FTPFile;
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_72

    .line 118
    invoke-virtual {p0, v9}, Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 119
    .local v2, "dirString":Ljava/lang/String;
    const/4 v7, 0x2

    invoke-virtual {p0, v7}, Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 120
    .local v0, "attrib":Ljava/lang/String;
    const/4 v7, 0x3

    invoke-virtual {p0, v7}, Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 121
    .local v6, "user":Ljava/lang/String;
    const/4 v7, 0x4

    invoke-virtual {p0, v7}, Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 122
    .local v5, "size":Ljava/lang/String;
    const/4 v7, 0x5

    invoke-virtual {p0, v7}, Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 123
    .local v1, "datestr":Ljava/lang/String;
    const/16 v7, 0x9

    invoke-virtual {p0, v7}, Lorg/apache/commons/net/ftp/parser/NetwareFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, "name":Ljava/lang/String;
    :try_start_2c
    invoke-super {p0, v1}, Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;->parseTimestamp(Ljava/lang/String;)Ljava/util/Calendar;

    move-result-object v7

    invoke-virtual {v3, v7}, Lorg/apache/commons/net/ftp/FTPFile;->setTimestamp(Ljava/util/Calendar;)V
    :try_end_33
    .catch Ljava/text/ParseException; {:try_start_2c .. :try_end_33} :catch_74

    .line 132
    :goto_33
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v8, "d"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6e

    .line 133
    invoke-virtual {v3, v9}, Lorg/apache/commons/net/ftp/FTPFile;->setType(I)V

    .line 139
    :goto_42
    invoke-virtual {v3, v6}, Lorg/apache/commons/net/ftp/FTPFile;->setUser(Ljava/lang/String;)V

    .line 142
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    .line 145
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-virtual {v3, v7, v8}, Lorg/apache/commons/net/ftp/FTPFile;->setSize(J)V

    .line 149
    const-string v7, "R"

    invoke-virtual {v0, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-eq v7, v11, :cond_62

    .line 150
    invoke-virtual {v3, v10, v10, v9}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    .line 153
    :cond_62
    const-string v7, "W"

    invoke-virtual {v0, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-eq v7, v11, :cond_6d

    .line 154
    invoke-virtual {v3, v10, v9, v9}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    .line 160
    .end local v0    # "attrib":Ljava/lang/String;
    .end local v1    # "datestr":Ljava/lang/String;
    .end local v2    # "dirString":Ljava/lang/String;
    .end local v3    # "f":Lorg/apache/commons/net/ftp/FTPFile;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "size":Ljava/lang/String;
    .end local v6    # "user":Ljava/lang/String;
    :cond_6d
    :goto_6d
    return-object v3

    .line 136
    .restart local v0    # "attrib":Ljava/lang/String;
    .restart local v1    # "datestr":Ljava/lang/String;
    .restart local v2    # "dirString":Ljava/lang/String;
    .restart local v3    # "f":Lorg/apache/commons/net/ftp/FTPFile;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v5    # "size":Ljava/lang/String;
    .restart local v6    # "user":Ljava/lang/String;
    :cond_6e
    invoke-virtual {v3, v10}, Lorg/apache/commons/net/ftp/FTPFile;->setType(I)V

    goto :goto_42

    .line 160
    .end local v0    # "attrib":Ljava/lang/String;
    .end local v1    # "datestr":Ljava/lang/String;
    .end local v2    # "dirString":Ljava/lang/String;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "size":Ljava/lang/String;
    .end local v6    # "user":Ljava/lang/String;
    :cond_72
    const/4 v3, 0x0

    goto :goto_6d

    .line 127
    .restart local v0    # "attrib":Ljava/lang/String;
    .restart local v1    # "datestr":Ljava/lang/String;
    .restart local v2    # "dirString":Ljava/lang/String;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v5    # "size":Ljava/lang/String;
    .restart local v6    # "user":Ljava/lang/String;
    :catch_74
    move-exception v7

    goto :goto_33
.end method
