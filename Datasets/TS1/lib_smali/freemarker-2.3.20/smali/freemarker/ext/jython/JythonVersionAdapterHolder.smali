.class Lfreemarker/ext/jython/JythonVersionAdapterHolder;
.super Ljava/lang/Object;
.source "JythonVersionAdapterHolder.java"


# static fields
.field static final INSTANCE:Lfreemarker/ext/jython/JythonVersionAdapter;

.field static class$freemarker$ext$jython$JythonVersionAdapter:Ljava/lang/Class;

.field static class$org$python$core$PySystemState:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 22
    :try_start_0
    sget-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->class$org$python$core$PySystemState:Ljava/lang/Class;

    if-nez v3, :cond_43

    const-string v3, "org.python.core.PySystemState"

    invoke-static {v3}, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->class$org$python$core$PySystemState:Ljava/lang/Class;

    :goto_c
    const-string v4, "version"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lfreemarker/template/utility/StringUtil;->versionStringToInt(Ljava/lang/String;)I
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_46

    move-result v2

    .line 27
    .local v2, "version":I
    sget-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->class$freemarker$ext$jython$JythonVersionAdapter:Ljava/lang/Class;

    if-nez v3, :cond_60

    const-string v3, "freemarker.ext.jython.JythonVersionAdapter"

    invoke-static {v3}, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->class$freemarker$ext$jython$JythonVersionAdapter:Ljava/lang/Class;

    :goto_2b
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 29
    .local v0, "cl":Ljava/lang/ClassLoader;
    const v3, 0x1e9808

    if-lt v2, v3, :cond_63

    .line 30
    :try_start_34
    const-string v3, "freemarker.ext.jython._Jython25VersionAdapter"

    invoke-virtual {v0, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/jython/JythonVersionAdapter;

    sput-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->INSTANCE:Lfreemarker/ext/jython/JythonVersionAdapter;
    :try_end_42
    .catch Ljava/lang/ClassNotFoundException; {:try_start_34 .. :try_end_42} :catch_77
    .catch Ljava/lang/IllegalAccessException; {:try_start_34 .. :try_end_42} :catch_8c
    .catch Ljava/lang/InstantiationException; {:try_start_34 .. :try_end_42} :catch_92

    .line 49
    :goto_42
    return-void

    .line 22
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v2    # "version":I
    :cond_43
    :try_start_43
    sget-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->class$org$python$core$PySystemState:Ljava/lang/Class;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_45} :catch_46

    goto :goto_c

    .line 24
    :catch_46
    move-exception v1

    .line 25
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Failed to get Jython version: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 27
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "version":I
    :cond_60
    sget-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->class$freemarker$ext$jython$JythonVersionAdapter:Ljava/lang/Class;

    goto :goto_2b

    .line 33
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    :cond_63
    const v3, 0x1e8c50

    if-lt v2, v3, :cond_7d

    .line 34
    :try_start_68
    const-string v3, "freemarker.ext.jython._Jython22VersionAdapter"

    invoke-virtual {v0, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/jython/JythonVersionAdapter;

    sput-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->INSTANCE:Lfreemarker/ext/jython/JythonVersionAdapter;
    :try_end_76
    .catch Ljava/lang/ClassNotFoundException; {:try_start_68 .. :try_end_76} :catch_77
    .catch Ljava/lang/IllegalAccessException; {:try_start_68 .. :try_end_76} :catch_8c
    .catch Ljava/lang/InstantiationException; {:try_start_68 .. :try_end_76} :catch_92

    goto :goto_42

    .line 42
    :catch_77
    move-exception v1

    .line 43
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    invoke-static {v1}, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->adapterCreationException(Ljava/lang/Exception;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 38
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :cond_7d
    :try_start_7d
    const-string v3, "freemarker.ext.jython._Jython20And21VersionAdapter"

    invoke-virtual {v0, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/jython/JythonVersionAdapter;

    sput-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->INSTANCE:Lfreemarker/ext/jython/JythonVersionAdapter;
    :try_end_8b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7d .. :try_end_8b} :catch_77
    .catch Ljava/lang/IllegalAccessException; {:try_start_7d .. :try_end_8b} :catch_8c
    .catch Ljava/lang/InstantiationException; {:try_start_7d .. :try_end_8b} :catch_92

    goto :goto_42

    .line 44
    :catch_8c
    move-exception v1

    .line 45
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v1}, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->adapterCreationException(Ljava/lang/Exception;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 46
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_92
    move-exception v1

    .line 47
    .local v1, "e":Ljava/lang/InstantiationException;
    invoke-static {v1}, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->adapterCreationException(Ljava/lang/Exception;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static adapterCreationException(Ljava/lang/Exception;)Ljava/lang/RuntimeException;
    .registers 4
    .param p0, "e"    # Ljava/lang/Exception;

    .prologue
    .line 52
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unexpected exception when creating JythonVersionAdapter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 23
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method
