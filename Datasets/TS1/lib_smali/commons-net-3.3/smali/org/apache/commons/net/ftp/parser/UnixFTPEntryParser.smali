.class public Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;
.super Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;
.source "UnixFTPEntryParser.java"


# static fields
.field static final DEFAULT_DATE_FORMAT:Ljava/lang/String; = "MMM d yyyy"

.field static final DEFAULT_RECENT_DATE_FORMAT:Ljava/lang/String; = "MMM d HH:mm"

.field public static final NUMERIC_DATE_CONFIG:Lorg/apache/commons/net/ftp/FTPClientConfig;

.field static final NUMERIC_DATE_FORMAT:Ljava/lang/String; = "yyyy-MM-dd HH:mm"

.field private static final REGEX:Ljava/lang/String; = "([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s*(\\d+)\\s+(?:(\\S+(?:\\s\\S+)*?)\\s+)?(?:(\\S+(?:\\s\\S+)*)\\s+)?(\\d+(?:,\\s*\\d+)?)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)"


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v3, 0x0

    .line 60
    new-instance v0, Lorg/apache/commons/net/ftp/FTPClientConfig;

    const-string v1, "UNIX"

    const-string v2, "yyyy-MM-dd HH:mm"

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/net/ftp/FTPClientConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->NUMERIC_DATE_CONFIG:Lorg/apache/commons/net/ftp/FTPClientConfig;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 121
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;-><init>(Lorg/apache/commons/net/ftp/FTPClientConfig;)V

    .line 122
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/net/ftp/FTPClientConfig;)V
    .registers 3
    .param p1, "config"    # Lorg/apache/commons/net/ftp/FTPClientConfig;

    .prologue
    .line 138
    const-string v0, "([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s*(\\d+)\\s+(?:(\\S+(?:\\s\\S+)*?)\\s+)?(?:(\\S+(?:\\s\\S+)*)\\s+)?(\\d+(?:,\\s*\\d+)?)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)"

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;-><init>(Ljava/lang/String;)V

    .line 139
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->configure(Lorg/apache/commons/net/ftp/FTPClientConfig;)V

    .line 140
    return-void
.end method


# virtual methods
.method protected getDefaultConfiguration()Lorg/apache/commons/net/ftp/FTPClientConfig;
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 311
    new-instance v0, Lorg/apache/commons/net/ftp/FTPClientConfig;

    const-string v1, "UNIX"

    const-string v2, "MMM d yyyy"

    const-string v3, "MMM d HH:mm"

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/net/ftp/FTPClientConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public parseFTPEntry(Ljava/lang/String;)Lorg/apache/commons/net/ftp/FTPFile;
    .registers 22
    .param p1, "entry"    # Ljava/lang/String;

    .prologue
    .line 169
    new-instance v7, Lorg/apache/commons/net/ftp/FTPFile;

    invoke-direct {v7}, Lorg/apache/commons/net/ftp/FTPFile;-><init>()V

    .line 170
    .local v7, "file":Lorg/apache/commons/net/ftp/FTPFile;
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setRawListing(Ljava/lang/String;)V

    .line 172
    const/4 v12, 0x0

    .line 174
    .local v12, "isDevice":Z
    invoke-virtual/range {p0 .. p1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->matches(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_1a1

    .line 176
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v15

    .line 177
    .local v15, "typeStr":Ljava/lang/String;
    const/16 v17, 0xf

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v11

    .line 178
    .local v11, "hardLinkCount":Ljava/lang/String;
    const/16 v17, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v16

    .line 179
    .local v16, "usr":Ljava/lang/String;
    const/16 v17, 0x11

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v10

    .line 180
    .local v10, "grp":Ljava/lang/String;
    const/16 v17, 0x12

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v8

    .line 181
    .local v8, "filesize":Ljava/lang/String;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v18, 0x13

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x14

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 182
    .local v3, "datestr":Ljava/lang/String;
    const/16 v17, 0x15

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v13

    .line 183
    .local v13, "name":Ljava/lang/String;
    const/16 v17, 0x16

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 187
    .local v5, "endtoken":Ljava/lang/String;
    :try_start_82
    move-object/from16 v0, p0

    invoke-super {v0, v3}, Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;->parseTimestamp(Ljava/lang/String;)Ljava/util/Calendar;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setTimestamp(Ljava/util/Calendar;)V
    :try_end_8d
    .catch Ljava/text/ParseException; {:try_start_82 .. :try_end_8d} :catch_1a7

    .line 198
    :goto_8d
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->charAt(I)C

    move-result v17

    sparse-switch v17, :sswitch_data_1aa

    .line 219
    const/4 v14, 0x3

    .line 222
    .local v14, "type":I
    :goto_99
    invoke-virtual {v7, v14}, Lorg/apache/commons/net/ftp/FTPFile;->setType(I)V

    .line 224
    const/4 v9, 0x4

    .line 225
    .local v9, "g":I
    const/4 v2, 0x0

    .local v2, "access":I
    :goto_9e
    const/16 v17, 0x3

    move/from16 v0, v17

    if-ge v2, v0, :cond_133

    .line 228
    const/16 v18, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v17

    const-string v19, "-"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_121

    const/16 v17, 0x1

    :goto_ba
    move/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v7, v2, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    .line 230
    const/16 v18, 0x1

    add-int/lit8 v17, v9, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v17

    const-string v19, "-"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_124

    const/16 v17, 0x1

    :goto_db
    move/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v7, v2, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    .line 233
    add-int/lit8 v17, v9, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/parser/UnixFTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 234
    .local v6, "execPerm":Ljava/lang/String;
    const-string v17, "-"

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_127

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v17

    if-nez v17, :cond_127

    .line 236
    const/16 v17, 0x2

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v7, v2, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    .line 225
    :goto_10f
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v9, v9, 0x4

    goto :goto_9e

    .line 201
    .end local v2    # "access":I
    .end local v6    # "execPerm":Ljava/lang/String;
    .end local v9    # "g":I
    .end local v14    # "type":I
    :sswitch_114
    const/4 v14, 0x1

    .line 202
    .restart local v14    # "type":I
    goto :goto_99

    .line 204
    .end local v14    # "type":I
    :sswitch_116
    const/4 v14, 0x2

    .line 205
    .restart local v14    # "type":I
    goto :goto_99

    .line 207
    .end local v14    # "type":I
    :sswitch_118
    const/4 v14, 0x2

    .line 208
    .restart local v14    # "type":I
    goto :goto_99

    .line 211
    .end local v14    # "type":I
    :sswitch_11a
    const/4 v12, 0x1

    .line 212
    const/4 v14, 0x0

    .line 213
    .restart local v14    # "type":I
    goto/16 :goto_99

    .line 216
    .end local v14    # "type":I
    :sswitch_11e
    const/4 v14, 0x0

    .line 217
    .restart local v14    # "type":I
    goto/16 :goto_99

    .line 228
    .restart local v2    # "access":I
    .restart local v9    # "g":I
    :cond_121
    const/16 v17, 0x0

    goto :goto_ba

    .line 230
    :cond_124
    const/16 v17, 0x0

    goto :goto_db

    .line 240
    .restart local v6    # "execPerm":Ljava/lang/String;
    :cond_127
    const/16 v17, 0x2

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v7, v2, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setPermission(IIZ)V

    goto :goto_10f

    .line 244
    .end local v6    # "execPerm":Ljava/lang/String;
    :cond_133
    if-nez v12, :cond_13e

    .line 248
    :try_start_135
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setHardLinkCount(I)V
    :try_end_13e
    .catch Ljava/lang/NumberFormatException; {:try_start_135 .. :try_end_13e} :catch_1a5

    .line 256
    :cond_13e
    :goto_13e
    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setUser(Ljava/lang/String;)V

    .line 257
    invoke-virtual {v7, v10}, Lorg/apache/commons/net/ftp/FTPFile;->setGroup(Ljava/lang/String;)V

    .line 261
    :try_start_146
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v7, v0, v1}, Lorg/apache/commons/net/ftp/FTPFile;->setSize(J)V
    :try_end_14f
    .catch Ljava/lang/NumberFormatException; {:try_start_146 .. :try_end_14f} :catch_1a3

    .line 268
    :goto_14f
    if-nez v5, :cond_155

    .line 270
    invoke-virtual {v7, v13}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    .line 300
    .end local v2    # "access":I
    .end local v3    # "datestr":Ljava/lang/String;
    .end local v5    # "endtoken":Ljava/lang/String;
    .end local v7    # "file":Lorg/apache/commons/net/ftp/FTPFile;
    .end local v8    # "filesize":Ljava/lang/String;
    .end local v9    # "g":I
    .end local v10    # "grp":Ljava/lang/String;
    .end local v11    # "hardLinkCount":Ljava/lang/String;
    .end local v13    # "name":Ljava/lang/String;
    .end local v14    # "type":I
    .end local v15    # "typeStr":Ljava/lang/String;
    .end local v16    # "usr":Ljava/lang/String;
    :goto_154
    return-object v7

    .line 276
    .restart local v2    # "access":I
    .restart local v3    # "datestr":Ljava/lang/String;
    .restart local v5    # "endtoken":Ljava/lang/String;
    .restart local v7    # "file":Lorg/apache/commons/net/ftp/FTPFile;
    .restart local v8    # "filesize":Ljava/lang/String;
    .restart local v9    # "g":I
    .restart local v10    # "grp":Ljava/lang/String;
    .restart local v11    # "hardLinkCount":Ljava/lang/String;
    .restart local v13    # "name":Ljava/lang/String;
    .restart local v14    # "type":I
    .restart local v15    # "typeStr":Ljava/lang/String;
    .restart local v16    # "usr":Ljava/lang/String;
    :cond_155
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 277
    const/16 v17, 0x2

    move/from16 v0, v17

    if-ne v14, v0, :cond_19d

    .line 280
    const-string v17, " -> "

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 282
    .local v4, "end":I
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v4, v0, :cond_182

    .line 284
    invoke-virtual {v7, v13}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    goto :goto_154

    .line 288
    :cond_182
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v13, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    .line 289
    add-int/lit8 v17, v4, 0x4

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setLink(Ljava/lang/String;)V

    goto :goto_154

    .line 295
    .end local v4    # "end":I
    :cond_19d
    invoke-virtual {v7, v13}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    goto :goto_154

    .line 300
    .end local v2    # "access":I
    .end local v3    # "datestr":Ljava/lang/String;
    .end local v5    # "endtoken":Ljava/lang/String;
    .end local v8    # "filesize":Ljava/lang/String;
    .end local v9    # "g":I
    .end local v10    # "grp":Ljava/lang/String;
    .end local v11    # "hardLinkCount":Ljava/lang/String;
    .end local v13    # "name":Ljava/lang/String;
    .end local v14    # "type":I
    .end local v15    # "typeStr":Ljava/lang/String;
    .end local v16    # "usr":Ljava/lang/String;
    :cond_1a1
    const/4 v7, 0x0

    goto :goto_154

    .line 263
    .restart local v2    # "access":I
    .restart local v3    # "datestr":Ljava/lang/String;
    .restart local v5    # "endtoken":Ljava/lang/String;
    .restart local v8    # "filesize":Ljava/lang/String;
    .restart local v9    # "g":I
    .restart local v10    # "grp":Ljava/lang/String;
    .restart local v11    # "hardLinkCount":Ljava/lang/String;
    .restart local v13    # "name":Ljava/lang/String;
    .restart local v14    # "type":I
    .restart local v15    # "typeStr":Ljava/lang/String;
    .restart local v16    # "usr":Ljava/lang/String;
    :catch_1a3
    move-exception v17

    goto :goto_14f

    .line 250
    :catch_1a5
    move-exception v17

    goto :goto_13e

    .line 189
    .end local v2    # "access":I
    .end local v9    # "g":I
    .end local v14    # "type":I
    :catch_1a7
    move-exception v17

    goto/16 :goto_8d

    .line 198
    :sswitch_data_1aa
    .sparse-switch
        0x2d -> :sswitch_11e
        0x62 -> :sswitch_11a
        0x63 -> :sswitch_11a
        0x64 -> :sswitch_114
        0x65 -> :sswitch_116
        0x66 -> :sswitch_11e
        0x6c -> :sswitch_118
    .end sparse-switch
.end method

.method public preParse(Ljava/util/List;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 147
    .local p1, "original":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 148
    .local v1, "iter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Ljava/lang/String;>;"
    :cond_4
    :goto_4
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 149
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 150
    .local v0, "entry":Ljava/lang/String;
    const-string v2, "^total \\d+$"

    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 151
    invoke-interface {v1}, Ljava/util/ListIterator;->remove()V

    goto :goto_4

    .line 154
    .end local v0    # "entry":Ljava/lang/String;
    :cond_1c
    return-object p1
.end method
