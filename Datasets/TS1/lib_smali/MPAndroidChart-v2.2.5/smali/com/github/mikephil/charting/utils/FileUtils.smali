.class public Lcom/github/mikephil/charting/utils/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# static fields
.field private static final LOG:Ljava/lang/String; = "MPChart-FileUtils"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static loadBarEntriesFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/util/List;
    .registers 11
    .param p0, "am"    # Landroid/content/res/AssetManager;
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/AssetManager;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/BarEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 232
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 234
    .local v1, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/BarEntry;>;"
    const/4 v3, 0x0

    .line 236
    .local v3, "reader":Ljava/io/BufferedReader;
    :try_start_6
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-direct {v6, v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v4, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_16} :catch_50
    .catchall {:try_start_6 .. :try_end_16} :catchall_6b

    .line 239
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .local v4, "reader":Ljava/io/BufferedReader;
    :try_start_16
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 241
    .local v2, "line":Ljava/lang/String;
    :goto_1a
    if-eqz v2, :cond_3d

    .line 243
    const-string v6, "#"

    invoke-virtual {v2, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 245
    .local v5, "split":[Ljava/lang/String;
    new-instance v6, Lcom/github/mikephil/charting/data/BarEntry;

    const/4 v7, 0x0

    aget-object v7, v5, v7

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-direct {v6, v7, v8}, Lcom/github/mikephil/charting/data/BarEntry;-><init>(FI)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_3b} :catch_80
    .catchall {:try_start_16 .. :try_end_3b} :catchall_7d

    move-result-object v2

    .line 248
    goto :goto_1a

    .line 254
    .end local v5    # "split":[Ljava/lang/String;
    :cond_3d
    if-eqz v4, :cond_83

    .line 256
    :try_start_3f
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_42} :catch_44

    move-object v3, v4

    .line 263
    .end local v2    # "line":Ljava/lang/String;
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :cond_43
    :goto_43
    return-object v1

    .line 257
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "line":Ljava/lang/String;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :catch_44
    move-exception v0

    .line 258
    .local v0, "e":Ljava/io/IOException;
    const-string v6, "MPChart-FileUtils"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v3, v4

    .line 259
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    goto :goto_43

    .line 249
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "line":Ljava/lang/String;
    :catch_50
    move-exception v0

    .line 250
    .restart local v0    # "e":Ljava/io/IOException;
    :goto_51
    :try_start_51
    const-string v6, "MPChart-FileUtils"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5a
    .catchall {:try_start_51 .. :try_end_5a} :catchall_6b

    .line 254
    if-eqz v3, :cond_43

    .line 256
    :try_start_5c
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_60

    goto :goto_43

    .line 257
    :catch_60
    move-exception v0

    .line 258
    const-string v6, "MPChart-FileUtils"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_43

    .line 254
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_6b
    move-exception v6

    :goto_6c
    if-eqz v3, :cond_71

    .line 256
    :try_start_6e
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_71} :catch_72

    .line 259
    :cond_71
    :goto_71
    throw v6

    .line 257
    :catch_72
    move-exception v0

    .line 258
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v7, "MPChart-FileUtils"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_71

    .line 254
    .end local v0    # "e":Ljava/io/IOException;
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :catchall_7d
    move-exception v6

    move-object v3, v4

    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    goto :goto_6c

    .line 249
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :catch_80
    move-exception v0

    move-object v3, v4

    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    goto :goto_51

    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "line":Ljava/lang/String;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :cond_83
    move-object v3, v4

    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    goto :goto_43
.end method

.method public static loadEntriesFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/util/List;
    .registers 13
    .param p0, "am"    # Landroid/content/res/AssetManager;
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/AssetManager;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .local v1, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    const/4 v4, 0x0

    .line 115
    .local v4, "reader":Ljava/io/BufferedReader;
    :try_start_6
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v9

    const-string v10, "UTF-8"

    invoke-direct {v8, v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v5, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_16} :catch_ab
    .catchall {:try_start_6 .. :try_end_16} :catchall_96

    .line 118
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .local v5, "reader":Ljava/io/BufferedReader;
    :try_start_16
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 120
    .local v3, "line":Ljava/lang/String;
    :goto_1a
    if-eqz v3, :cond_78

    .line 122
    const-string v8, "#"

    invoke-virtual {v3, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 124
    .local v6, "split":[Ljava/lang/String;
    array-length v8, v6

    const/4 v9, 0x2

    if-gt v8, v9, :cond_41

    .line 125
    new-instance v8, Lcom/github/mikephil/charting/data/Entry;

    const/4 v9, 0x0

    aget-object v9, v6, v9

    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v9

    const/4 v10, 0x1

    aget-object v10, v6, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-direct {v8, v9, v10}, Lcom/github/mikephil/charting/data/Entry;-><init>(FI)V

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    :goto_3c
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 137
    goto :goto_1a

    .line 128
    :cond_41
    array-length v8, v6

    add-int/lit8 v8, v8, -0x1

    new-array v7, v8, [F

    .line 130
    .local v7, "vals":[F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_47
    array-length v8, v7

    if-ge v2, v8, :cond_55

    .line 131
    aget-object v8, v6, v2

    invoke-static {v8}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v8

    aput v8, v7, v2

    .line 130
    add-int/lit8 v2, v2, 0x1

    goto :goto_47

    .line 134
    :cond_55
    new-instance v8, Lcom/github/mikephil/charting/data/BarEntry;

    array-length v9, v6

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v6, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-direct {v8, v7, v9}, Lcom/github/mikephil/charting/data/BarEntry;-><init>([FI)V

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_66} :catch_67
    .catchall {:try_start_16 .. :try_end_66} :catchall_a8

    goto :goto_3c

    .line 138
    .end local v2    # "i":I
    .end local v3    # "line":Ljava/lang/String;
    .end local v6    # "split":[Ljava/lang/String;
    .end local v7    # "vals":[F
    :catch_67
    move-exception v0

    move-object v4, v5

    .line 139
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .local v0, "e":Ljava/io/IOException;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :goto_69
    :try_start_69
    const-string v8, "MPChart-FileUtils"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_72
    .catchall {:try_start_69 .. :try_end_72} :catchall_96

    .line 143
    if-eqz v4, :cond_77

    .line 145
    :try_start_74
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_77
    .catch Ljava/io/IOException; {:try_start_74 .. :try_end_77} :catch_8b

    .line 152
    .end local v0    # "e":Ljava/io/IOException;
    :cond_77
    :goto_77
    return-object v1

    .line 143
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :cond_78
    if-eqz v5, :cond_ad

    .line 145
    :try_start_7a
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_7d
    .catch Ljava/io/IOException; {:try_start_7a .. :try_end_7d} :catch_7f

    move-object v4, v5

    .line 148
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    goto :goto_77

    .line 146
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :catch_7f
    move-exception v0

    .line 147
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v8, "MPChart-FileUtils"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v5

    .line 148
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    goto :goto_77

    .line 146
    .end local v3    # "line":Ljava/lang/String;
    :catch_8b
    move-exception v0

    .line 147
    const-string v8, "MPChart-FileUtils"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_77

    .line 143
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_96
    move-exception v8

    :goto_97
    if-eqz v4, :cond_9c

    .line 145
    :try_start_99
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_9c
    .catch Ljava/io/IOException; {:try_start_99 .. :try_end_9c} :catch_9d

    .line 148
    :cond_9c
    :goto_9c
    throw v8

    .line 146
    :catch_9d
    move-exception v0

    .line 147
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v9, "MPChart-FileUtils"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9c

    .line 143
    .end local v0    # "e":Ljava/io/IOException;
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :catchall_a8
    move-exception v8

    move-object v4, v5

    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    goto :goto_97

    .line 138
    :catch_ab
    move-exception v0

    goto :goto_69

    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :cond_ad
    move-object v4, v5

    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    goto :goto_77
.end method

.method public static loadEntriesFromFile(Ljava/lang/String;)Ljava/util/List;
    .registers 13
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    .line 42
    .local v6, "sdcard":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v6, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 44
    .local v3, "file":Ljava/io/File;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .local v2, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    :try_start_e
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/FileReader;

    invoke-direct {v9, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 51
    .local v0, "br":Ljava/io/BufferedReader;
    :goto_18
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "line":Ljava/lang/String;
    if-eqz v5, :cond_49

    .line 52
    const-string v9, "#"

    invoke-virtual {v5, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 54
    .local v7, "split":[Ljava/lang/String;
    array-length v9, v7

    const/4 v10, 0x2

    if-gt v9, v10, :cond_4a

    .line 55
    new-instance v9, Lcom/github/mikephil/charting/data/Entry;

    const/4 v10, 0x0

    aget-object v10, v7, v10

    invoke-static {v10}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v10

    const/4 v11, 0x1

    aget-object v11, v7, v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    invoke-direct {v9, v10, v11}, Lcom/github/mikephil/charting/data/Entry;-><init>(FI)V

    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_3e} :catch_3f

    goto :goto_18

    .line 67
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v7    # "split":[Ljava/lang/String;
    :catch_3f
    move-exception v1

    .line 68
    .local v1, "e":Ljava/io/IOException;
    const-string v9, "MPChart-FileUtils"

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .end local v1    # "e":Ljava/io/IOException;
    :cond_49
    return-object v2

    .line 58
    .restart local v0    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v7    # "split":[Ljava/lang/String;
    :cond_4a
    :try_start_4a
    array-length v9, v7

    add-int/lit8 v9, v9, -0x1

    new-array v8, v9, [F

    .line 60
    .local v8, "vals":[F
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_50
    array-length v9, v8

    if-ge v4, v9, :cond_5e

    .line 61
    aget-object v9, v7, v4

    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v9

    aput v9, v8, v4

    .line 60
    add-int/lit8 v4, v4, 0x1

    goto :goto_50

    .line 64
    :cond_5e
    new-instance v9, Lcom/github/mikephil/charting/data/BarEntry;

    array-length v10, v7

    add-int/lit8 v10, v10, -0x1

    aget-object v10, v7, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-direct {v9, v8, v10}, Lcom/github/mikephil/charting/data/BarEntry;-><init>([FI)V

    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_6f} :catch_3f

    goto :goto_18
.end method

.method public static saveToSdCard(Ljava/util/List;Ljava/lang/String;)V
    .registers 9
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 199
    .local p0, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 201
    .local v4, "sdcard":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 202
    .local v3, "saved":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_12

    .line 206
    :try_start_f
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_12} :catch_5e

    .line 215
    :cond_12
    :goto_12
    :try_start_12
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/FileWriter;

    const/4 v6, 0x1

    invoke-direct {v5, v3, v6}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v0, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 217
    .local v0, "buf":Ljava/io/BufferedWriter;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_69

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/Entry;

    .line 219
    .local v1, "e":Lcom/github/mikephil/charting/data/Entry;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "#"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 220
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_52} :catch_53

    goto :goto_21

    .line 224
    .end local v0    # "buf":Ljava/io/BufferedWriter;
    .end local v1    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v2    # "i$":Ljava/util/Iterator;
    :catch_53
    move-exception v1

    .line 226
    .local v1, "e":Ljava/io/IOException;
    const-string v5, "MPChart-FileUtils"

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    .end local v1    # "e":Ljava/io/IOException;
    :goto_5d
    return-void

    .line 207
    :catch_5e
    move-exception v1

    .line 209
    .restart local v1    # "e":Ljava/io/IOException;
    const-string v5, "MPChart-FileUtils"

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12

    .line 223
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "buf":Ljava/io/BufferedWriter;
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_69
    :try_start_69
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_6c
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_6c} :catch_53

    goto :goto_5d
.end method
