.class public Lorg/apache/commons/io/IOUtils;
.super Ljava/lang/Object;
.source "IOUtils.java"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x1000

.field public static final DIR_SEPARATOR:C

.field public static final DIR_SEPARATOR_UNIX:C = '/'

.field public static final DIR_SEPARATOR_WINDOWS:C = '\\'

.field public static final LINE_SEPARATOR:Ljava/lang/String;

.field public static final LINE_SEPARATOR_UNIX:Ljava/lang/String; = "\n"

.field public static final LINE_SEPARATOR_WINDOWS:Ljava/lang/String; = "\r\n"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 97
    sget-char v2, Ljava/io/File;->separatorChar:C

    sput-char v2, Lorg/apache/commons/io/IOUtils;->DIR_SEPARATOR:C

    .line 112
    new-instance v0, Ljava/io/StringWriter;

    const/4 v2, 0x4

    invoke-direct {v0, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 113
    .local v0, "buf":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 114
    .local v1, "out":Ljava/io/PrintWriter;
    invoke-virtual {v1}, Ljava/io/PrintWriter;->println()V

    .line 115
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/io/IOUtils;->LINE_SEPARATOR:Ljava/lang/String;

    .line 116
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    return-void
.end method

.method public static closeQuietly(Ljava/io/InputStream;)V
    .registers 2
    .param p0, "input"    # Ljava/io/InputStream;

    .prologue
    .line 177
    if-eqz p0, :cond_5

    .line 178
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 183
    :cond_5
    :goto_5
    return-void

    .line 180
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static closeQuietly(Ljava/io/OutputStream;)V
    .registers 2
    .param p0, "output"    # Ljava/io/OutputStream;

    .prologue
    .line 195
    if-eqz p0, :cond_5

    .line 196
    :try_start_2
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 201
    :cond_5
    :goto_5
    return-void

    .line 198
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static closeQuietly(Ljava/io/Reader;)V
    .registers 2
    .param p0, "input"    # Ljava/io/Reader;

    .prologue
    .line 141
    if-eqz p0, :cond_5

    .line 142
    :try_start_2
    invoke-virtual {p0}, Ljava/io/Reader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 147
    :cond_5
    :goto_5
    return-void

    .line 144
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static closeQuietly(Ljava/io/Writer;)V
    .registers 2
    .param p0, "output"    # Ljava/io/Writer;

    .prologue
    .line 159
    if-eqz p0, :cond_5

    .line 160
    :try_start_2
    invoke-virtual {p0}, Ljava/io/Writer;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 165
    :cond_5
    :goto_5
    return-void

    .line 162
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static contentEquals(Ljava/io/InputStream;Ljava/io/InputStream;)Z
    .registers 9
    .param p0, "input1"    # Ljava/io/InputStream;
    .param p1, "input2"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v6, -0x1

    .line 1217
    instance-of v5, p0, Ljava/io/BufferedInputStream;

    if-nez v5, :cond_c

    .line 1218
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .end local p0    # "input1":Ljava/io/InputStream;
    .local v2, "input1":Ljava/io/InputStream;
    move-object p0, v2

    .line 1220
    .end local v2    # "input1":Ljava/io/InputStream;
    .restart local p0    # "input1":Ljava/io/InputStream;
    :cond_c
    instance-of v5, p1, Ljava/io/BufferedInputStream;

    if-nez v5, :cond_16

    .line 1221
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .end local p1    # "input2":Ljava/io/InputStream;
    .local v3, "input2":Ljava/io/InputStream;
    move-object p1, v3

    .line 1224
    .end local v3    # "input2":Ljava/io/InputStream;
    .restart local p1    # "input2":Ljava/io/InputStream;
    :cond_16
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 1225
    .local v0, "ch":I
    :goto_1a
    if-eq v6, v0, :cond_28

    .line 1226
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 1227
    .local v1, "ch2":I
    if-eq v0, v1, :cond_23

    .line 1234
    :cond_22
    :goto_22
    return v4

    .line 1230
    :cond_23
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 1231
    goto :goto_1a

    .line 1233
    .end local v1    # "ch2":I
    :cond_28
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 1234
    .restart local v1    # "ch2":I
    if-ne v1, v6, :cond_22

    const/4 v4, 0x1

    goto :goto_22
.end method

.method public static contentEquals(Ljava/io/Reader;Ljava/io/Reader;)Z
    .registers 9
    .param p0, "input1"    # Ljava/io/Reader;
    .param p1, "input2"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v6, -0x1

    .line 1254
    instance-of v5, p0, Ljava/io/BufferedReader;

    if-nez v5, :cond_c

    .line 1255
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, p0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .end local p0    # "input1":Ljava/io/Reader;
    .local v2, "input1":Ljava/io/Reader;
    move-object p0, v2

    .line 1257
    .end local v2    # "input1":Ljava/io/Reader;
    .restart local p0    # "input1":Ljava/io/Reader;
    :cond_c
    instance-of v5, p1, Ljava/io/BufferedReader;

    if-nez v5, :cond_16

    .line 1258
    new-instance v3, Ljava/io/BufferedReader;

    invoke-direct {v3, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .end local p1    # "input2":Ljava/io/Reader;
    .local v3, "input2":Ljava/io/Reader;
    move-object p1, v3

    .line 1261
    .end local v3    # "input2":Ljava/io/Reader;
    .restart local p1    # "input2":Ljava/io/Reader;
    :cond_16
    invoke-virtual {p0}, Ljava/io/Reader;->read()I

    move-result v0

    .line 1262
    .local v0, "ch":I
    :goto_1a
    if-eq v6, v0, :cond_28

    .line 1263
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v1

    .line 1264
    .local v1, "ch2":I
    if-eq v0, v1, :cond_23

    .line 1271
    :cond_22
    :goto_22
    return v4

    .line 1267
    :cond_23
    invoke-virtual {p0}, Ljava/io/Reader;->read()I

    move-result v0

    .line 1268
    goto :goto_1a

    .line 1270
    .end local v1    # "ch2":I
    :cond_28
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v1

    .line 1271
    .restart local v1    # "ch2":I
    if-ne v1, v6, :cond_22

    const/4 v4, 0x1

    goto :goto_22
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    .registers 6
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 999
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->copyLarge(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    move-result-wide v0

    .line 1000
    .local v0, "count":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_d

    .line 1001
    const/4 v2, -0x1

    .line 1003
    :goto_c
    return v2

    :cond_d
    long-to-int v2, v0

    goto :goto_c
.end method

.method public static copy(Ljava/io/Reader;Ljava/io/Writer;)I
    .registers 6
    .param p0, "input"    # Ljava/io/Reader;
    .param p1, "output"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1104
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->copyLarge(Ljava/io/Reader;Ljava/io/Writer;)J

    move-result-wide v0

    .line 1105
    .local v0, "count":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_d

    .line 1106
    const/4 v2, -0x1

    .line 1108
    :goto_c
    return v2

    :cond_d
    long-to-int v2, v0

    goto :goto_c
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/Writer;)V
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1049
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 1050
    .local v0, "in":Ljava/io/InputStreamReader;
    invoke-static {v0, p1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/Reader;Ljava/io/Writer;)I

    .line 1051
    return-void
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/Writer;Ljava/lang/String;)V
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/Writer;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1074
    if-nez p2, :cond_6

    .line 1075
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/Writer;)V

    .line 1080
    :goto_5
    return-void

    .line 1077
    :cond_6
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p0, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 1078
    .local v0, "in":Ljava/io/InputStreamReader;
    invoke-static {v0, p1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/Reader;Ljava/io/Writer;)I

    goto :goto_5
.end method

.method public static copy(Ljava/io/Reader;Ljava/io/OutputStream;)V
    .registers 3
    .param p0, "input"    # Ljava/io/Reader;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1156
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-direct {v0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 1157
    .local v0, "out":Ljava/io/OutputStreamWriter;
    invoke-static {p0, v0}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/Reader;Ljava/io/Writer;)I

    .line 1160
    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->flush()V

    .line 1161
    return-void
.end method

.method public static copy(Ljava/io/Reader;Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 4
    .param p0, "input"    # Ljava/io/Reader;
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1188
    if-nez p2, :cond_6

    .line 1189
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/Reader;Ljava/io/OutputStream;)V

    .line 1197
    :goto_5
    return-void

    .line 1191
    :cond_6
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-direct {v0, p1, p2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 1192
    .local v0, "out":Ljava/io/OutputStreamWriter;
    invoke-static {p0, v0}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/Reader;Ljava/io/Writer;)I

    .line 1195
    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->flush()V

    goto :goto_5
.end method

.method public static copyLarge(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .registers 8
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1022
    const/16 v4, 0x1000

    new-array v0, v4, [B

    .line 1023
    .local v0, "buffer":[B
    const-wide/16 v1, 0x0

    .line 1024
    .local v1, "count":J
    const/4 v3, 0x0

    .line 1025
    .local v3, "n":I
    :goto_7
    const/4 v4, -0x1

    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-eq v4, v3, :cond_15

    .line 1026
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 1027
    int-to-long v4, v3

    add-long/2addr v1, v4

    goto :goto_7

    .line 1029
    :cond_15
    return-wide v1
.end method

.method public static copyLarge(Ljava/io/Reader;Ljava/io/Writer;)J
    .registers 8
    .param p0, "input"    # Ljava/io/Reader;
    .param p1, "output"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1125
    const/16 v4, 0x1000

    new-array v0, v4, [C

    .line 1126
    .local v0, "buffer":[C
    const-wide/16 v1, 0x0

    .line 1127
    .local v1, "count":J
    const/4 v3, 0x0

    .line 1128
    .local v3, "n":I
    :goto_7
    const/4 v4, -0x1

    invoke-virtual {p0, v0}, Ljava/io/Reader;->read([C)I

    move-result v3

    if-eq v4, v3, :cond_15

    .line 1129
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v3}, Ljava/io/Writer;->write([CII)V

    .line 1130
    int-to-long v4, v3

    add-long/2addr v1, v4

    goto :goto_7

    .line 1132
    :cond_15
    return-wide v1
.end method

.method public static lineIterator(Ljava/io/InputStream;Ljava/lang/String;)Lorg/apache/commons/io/LineIterator;
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 575
    const/4 v0, 0x0

    .line 576
    .local v0, "reader":Ljava/io/Reader;
    if-nez p1, :cond_e

    .line 577
    new-instance v0, Ljava/io/InputStreamReader;

    .end local v0    # "reader":Ljava/io/Reader;
    invoke-direct {v0, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 581
    .restart local v0    # "reader":Ljava/io/Reader;
    :goto_8
    new-instance v1, Lorg/apache/commons/io/LineIterator;

    invoke-direct {v1, v0}, Lorg/apache/commons/io/LineIterator;-><init>(Ljava/io/Reader;)V

    return-object v1

    .line 579
    :cond_e
    new-instance v0, Ljava/io/InputStreamReader;

    .end local v0    # "reader":Ljava/io/Reader;
    invoke-direct {v0, p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .restart local v0    # "reader":Ljava/io/Reader;
    goto :goto_8
.end method

.method public static lineIterator(Ljava/io/Reader;)Lorg/apache/commons/io/LineIterator;
    .registers 2
    .param p0, "reader"    # Ljava/io/Reader;

    .prologue
    .line 540
    new-instance v0, Lorg/apache/commons/io/LineIterator;

    invoke-direct {v0, p0}, Lorg/apache/commons/io/LineIterator;-><init>(Ljava/io/Reader;)V

    return-object v0
.end method

.method public static readLines(Ljava/io/InputStream;)Ljava/util/List;
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 456
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 457
    .local v0, "reader":Ljava/io/InputStreamReader;
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->readLines(Ljava/io/Reader;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static readLines(Ljava/io/InputStream;Ljava/lang/String;)Ljava/util/List;
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 478
    if-nez p1, :cond_7

    .line 479
    invoke-static {p0}, Lorg/apache/commons/io/IOUtils;->readLines(Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v1

    .line 482
    :goto_6
    return-object v1

    .line 481
    :cond_7
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 482
    .local v0, "reader":Ljava/io/InputStreamReader;
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->readLines(Ljava/io/Reader;)Ljava/util/List;

    move-result-object v1

    goto :goto_6
.end method

.method public static readLines(Ljava/io/Reader;)Ljava/util/List;
    .registers 4
    .param p0, "input"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 500
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, p0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 501
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 502
    .local v1, "list":Ljava/util/List;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 503
    .local v0, "line":Ljava/lang/String;
    :goto_e
    if-eqz v0, :cond_18

    .line 504
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 505
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 507
    :cond_18
    return-object v1
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    new-instance v0, Lorg/apache/commons/io/output/ByteArrayOutputStream;

    invoke-direct {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;-><init>()V

    .line 218
    .local v0, "output":Lorg/apache/commons/io/output/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 219
    invoke-virtual {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static toByteArray(Ljava/io/Reader;)[B
    .registers 3
    .param p0, "input"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    new-instance v0, Lorg/apache/commons/io/output/ByteArrayOutputStream;

    invoke-direct {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;-><init>()V

    .line 236
    .local v0, "output":Lorg/apache/commons/io/output/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/Reader;Ljava/io/OutputStream;)V

    .line 237
    invoke-virtual {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static toByteArray(Ljava/io/Reader;Ljava/lang/String;)[B
    .registers 4
    .param p0, "input"    # Ljava/io/Reader;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    new-instance v0, Lorg/apache/commons/io/output/ByteArrayOutputStream;

    invoke-direct {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;-><init>()V

    .line 260
    .local v0, "output":Lorg/apache/commons/io/output/ByteArrayOutputStream;
    invoke-static {p0, v0, p1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/Reader;Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 261
    invoke-virtual {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static toByteArray(Ljava/lang/String;)[B
    .registers 2
    .param p0, "input"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 277
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public static toCharArray(Ljava/io/InputStream;)[C
    .registers 3
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 296
    new-instance v0, Ljava/io/CharArrayWriter;

    invoke-direct {v0}, Ljava/io/CharArrayWriter;-><init>()V

    .line 297
    .local v0, "output":Ljava/io/CharArrayWriter;
    invoke-static {p0, v0}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/Writer;)V

    .line 298
    invoke-virtual {v0}, Ljava/io/CharArrayWriter;->toCharArray()[C

    move-result-object v1

    return-object v1
.end method

.method public static toCharArray(Ljava/io/InputStream;Ljava/lang/String;)[C
    .registers 4
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 320
    new-instance v0, Ljava/io/CharArrayWriter;

    invoke-direct {v0}, Ljava/io/CharArrayWriter;-><init>()V

    .line 321
    .local v0, "output":Ljava/io/CharArrayWriter;
    invoke-static {p0, v0, p1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/Writer;Ljava/lang/String;)V

    .line 322
    invoke-virtual {v0}, Ljava/io/CharArrayWriter;->toCharArray()[C

    move-result-object v1

    return-object v1
.end method

.method public static toCharArray(Ljava/io/Reader;)[C
    .registers 3
    .param p0, "input"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 338
    new-instance v0, Ljava/io/CharArrayWriter;

    invoke-direct {v0}, Ljava/io/CharArrayWriter;-><init>()V

    .line 339
    .local v0, "sw":Ljava/io/CharArrayWriter;
    invoke-static {p0, v0}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/Reader;Ljava/io/Writer;)I

    .line 340
    invoke-virtual {v0}, Ljava/io/CharArrayWriter;->toCharArray()[C

    move-result-object v1

    return-object v1
.end method

.method public static toInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 3
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 594
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 595
    .local v0, "bytes":[B
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v1
.end method

.method public static toInputStream(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;
    .registers 4
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 612
    if-eqz p1, :cond_c

    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 613
    .local v0, "bytes":[B
    :goto_6
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v1

    .line 612
    .end local v0    # "bytes":[B
    :cond_c
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    goto :goto_6
.end method

.method public static toString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 358
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 359
    .local v0, "sw":Ljava/io/StringWriter;
    invoke-static {p0, v0}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/Writer;)V

    .line 360
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static toString(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 381
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 382
    .local v0, "sw":Ljava/io/StringWriter;
    invoke-static {p0, v0, p1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/Writer;Ljava/lang/String;)V

    .line 383
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static toString(Ljava/io/Reader;)Ljava/lang/String;
    .registers 3
    .param p0, "input"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 398
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 399
    .local v0, "sw":Ljava/io/StringWriter;
    invoke-static {p0, v0}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/Reader;Ljava/io/Writer;)I

    .line 400
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static toString([B)Ljava/lang/String;
    .registers 2
    .param p0, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 414
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static toString([BLjava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "input"    # [B
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 433
    if-nez p1, :cond_8

    .line 434
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    .line 436
    :goto_7
    return-object v0

    :cond_8
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    goto :goto_7
.end method

.method public static write(Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 3
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 783
    if-eqz p0, :cond_9

    .line 784
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 786
    :cond_9
    return-void
.end method

.method public static write(Ljava/lang/String;Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 4
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 806
    if-eqz p0, :cond_7

    .line 807
    if-nez p2, :cond_8

    .line 808
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->write(Ljava/lang/String;Ljava/io/OutputStream;)V

    .line 813
    :cond_7
    :goto_7
    return-void

    .line 810
    :cond_8
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    goto :goto_7
.end method

.method public static write(Ljava/lang/String;Ljava/io/Writer;)V
    .registers 2
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "output"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 763
    if-eqz p0, :cond_5

    .line 764
    invoke-virtual {p1, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 766
    :cond_5
    return-void
.end method

.method public static write(Ljava/lang/StringBuffer;Ljava/io/OutputStream;)V
    .registers 3
    .param p0, "data"    # Ljava/lang/StringBuffer;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 848
    if-eqz p0, :cond_d

    .line 849
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 851
    :cond_d
    return-void
.end method

.method public static write(Ljava/lang/StringBuffer;Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 4
    .param p0, "data"    # Ljava/lang/StringBuffer;
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 871
    if-eqz p0, :cond_7

    .line 872
    if-nez p2, :cond_8

    .line 873
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->write(Ljava/lang/StringBuffer;Ljava/io/OutputStream;)V

    .line 878
    :cond_7
    :goto_7
    return-void

    .line 875
    :cond_8
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    goto :goto_7
.end method

.method public static write(Ljava/lang/StringBuffer;Ljava/io/Writer;)V
    .registers 3
    .param p0, "data"    # Ljava/lang/StringBuffer;
    .param p1, "output"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 828
    if-eqz p0, :cond_9

    .line 829
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 831
    :cond_9
    return-void
.end method

.method public static write([BLjava/io/OutputStream;)V
    .registers 2
    .param p0, "data"    # [B
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 630
    if-eqz p0, :cond_5

    .line 631
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 633
    :cond_5
    return-void
.end method

.method public static write([BLjava/io/Writer;)V
    .registers 3
    .param p0, "data"    # [B
    .param p1, "output"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 649
    if-eqz p0, :cond_a

    .line 650
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 652
    :cond_a
    return-void
.end method

.method public static write([BLjava/io/Writer;Ljava/lang/String;)V
    .registers 4
    .param p0, "data"    # [B
    .param p1, "output"    # Ljava/io/Writer;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 673
    if-eqz p0, :cond_7

    .line 674
    if-nez p2, :cond_8

    .line 675
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->write([BLjava/io/Writer;)V

    .line 680
    :cond_7
    :goto_7
    return-void

    .line 677
    :cond_8
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_7
.end method

.method public static write([CLjava/io/OutputStream;)V
    .registers 3
    .param p0, "data"    # [C
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 717
    if-eqz p0, :cond_e

    .line 718
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 720
    :cond_e
    return-void
.end method

.method public static write([CLjava/io/OutputStream;Ljava/lang/String;)V
    .registers 4
    .param p0, "data"    # [C
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 742
    if-eqz p0, :cond_7

    .line 743
    if-nez p2, :cond_8

    .line 744
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->write([CLjava/io/OutputStream;)V

    .line 749
    :cond_7
    :goto_7
    return-void

    .line 746
    :cond_8
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    goto :goto_7
.end method

.method public static write([CLjava/io/Writer;)V
    .registers 2
    .param p0, "data"    # [C
    .param p1, "output"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 696
    if-eqz p0, :cond_5

    .line 697
    invoke-virtual {p1, p0}, Ljava/io/Writer;->write([C)V

    .line 699
    :cond_5
    return-void
.end method

.method public static writeLines(Ljava/util/Collection;Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 6
    .param p0, "lines"    # Ljava/util/Collection;
    .param p1, "lineEnding"    # Ljava/lang/String;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 896
    if-nez p0, :cond_3

    .line 909
    :cond_2
    return-void

    .line 899
    :cond_3
    if-nez p1, :cond_7

    .line 900
    sget-object p1, Lorg/apache/commons/io/IOUtils;->LINE_SEPARATOR:Ljava/lang/String;

    .line 902
    :cond_7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 903
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 904
    .local v1, "line":Ljava/lang/Object;
    if-eqz v1, :cond_22

    .line 905
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/io/OutputStream;->write([B)V

    .line 907
    :cond_22
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/io/OutputStream;->write([B)V

    goto :goto_b
.end method

.method public static writeLines(Ljava/util/Collection;Ljava/lang/String;Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 7
    .param p0, "lines"    # Ljava/util/Collection;
    .param p1, "lineEnding"    # Ljava/lang/String;
    .param p2, "output"    # Ljava/io/OutputStream;
    .param p3, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 929
    if-nez p3, :cond_6

    .line 930
    invoke-static {p0, p1, p2}, Lorg/apache/commons/io/IOUtils;->writeLines(Ljava/util/Collection;Ljava/lang/String;Ljava/io/OutputStream;)V

    .line 946
    :cond_5
    return-void

    .line 932
    :cond_6
    if-eqz p0, :cond_5

    .line 935
    if-nez p1, :cond_c

    .line 936
    sget-object p1, Lorg/apache/commons/io/IOUtils;->LINE_SEPARATOR:Ljava/lang/String;

    .line 938
    :cond_c
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 939
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 940
    .local v1, "line":Ljava/lang/Object;
    if-eqz v1, :cond_27

    .line 941
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/io/OutputStream;->write([B)V

    .line 943
    :cond_27
    invoke-virtual {p1, p3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/io/OutputStream;->write([B)V

    goto :goto_10
.end method

.method public static writeLines(Ljava/util/Collection;Ljava/lang/String;Ljava/io/Writer;)V
    .registers 6
    .param p0, "lines"    # Ljava/util/Collection;
    .param p1, "lineEnding"    # Ljava/lang/String;
    .param p2, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 961
    if-nez p0, :cond_3

    .line 974
    :cond_2
    return-void

    .line 964
    :cond_3
    if-nez p1, :cond_7

    .line 965
    sget-object p1, Lorg/apache/commons/io/IOUtils;->LINE_SEPARATOR:Ljava/lang/String;

    .line 967
    :cond_7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 968
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 969
    .local v1, "line":Ljava/lang/Object;
    if-eqz v1, :cond_1e

    .line 970
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 972
    :cond_1e
    invoke-virtual {p2, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_b
.end method
