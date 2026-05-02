.class public Lorg/jivesoftware/smack/debugger/ConsoleDebugger;
.super Ljava/lang/Object;
.source "ConsoleDebugger.java"

# interfaces
.implements Lorg/jivesoftware/smack/debugger/SmackDebugger;


# static fields
.field public static printInterpreted:Z


# instance fields
.field private connListener:Lorg/jivesoftware/smack/ConnectionListener;

.field private connection:Lorg/jivesoftware/smack/Connection;

.field private dateFormatter:Ljava/text/SimpleDateFormat;

.field private listener:Lorg/jivesoftware/smack/PacketListener;

.field private reader:Ljava/io/Reader;

.field private readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

.field private writer:Ljava/io/Writer;

.field private writerListener:Lorg/jivesoftware/smack/util/WriterListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    const/4 v0, 0x0

    sput-boolean v0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->printInterpreted:Z

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/io/Writer;Ljava/io/Reader;)V
    .registers 7
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "writer"    # Ljava/io/Writer;
    .param p3, "reader"    # Ljava/io/Reader;

    .prologue
    const/4 v2, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "hh:mm:ss aaa"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->dateFormatter:Ljava/text/SimpleDateFormat;

    .line 30
    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    .line 32
    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    .line 33
    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    .line 41
    iput-object p1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    .line 42
    iput-object p2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    .line 43
    iput-object p3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    .line 44
    invoke-direct {p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->createDebug()V

    .line 45
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)Ljava/text/SimpleDateFormat;
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/debugger/ConsoleDebugger;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->dateFormatter:Ljava/text/SimpleDateFormat;

    return-object v0
.end method

.method static synthetic access$100(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)Lorg/jivesoftware/smack/Connection;
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/debugger/ConsoleDebugger;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method private createDebug()V
    .registers 4

    .prologue
    .line 52
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableReader;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    invoke-direct {v0, v2}, Lorg/jivesoftware/smack/util/ObservableReader;-><init>(Ljava/io/Reader;)V

    .line 53
    .local v0, "debugReader":Lorg/jivesoftware/smack/util/ObservableReader;
    new-instance v2, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$1;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$1;-><init>(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)V

    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    .line 61
    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/util/ObservableReader;->addReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 64
    new-instance v1, Lorg/jivesoftware/smack/util/ObservableWriter;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/util/ObservableWriter;-><init>(Ljava/io/Writer;)V

    .line 65
    .local v1, "debugWriter":Lorg/jivesoftware/smack/util/ObservableWriter;
    new-instance v2, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$2;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$2;-><init>(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)V

    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    .line 73
    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableWriter;->addWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 77
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    .line 78
    iput-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    .line 83
    new-instance v2, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$3;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$3;-><init>(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)V

    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    .line 95
    new-instance v2, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$4;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$4;-><init>(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)V

    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    .line 132
    return-void
.end method


# virtual methods
.method public getReader()Ljava/io/Reader;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    return-object v0
.end method

.method public getReaderListener()Lorg/jivesoftware/smack/PacketListener;
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    return-object v0
.end method

.method public getWriter()Ljava/io/Writer;
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    return-object v0
.end method

.method public getWriterListener()Lorg/jivesoftware/smack/PacketListener;
    .registers 2

    .prologue
    .line 179
    const/4 v0, 0x0

    return-object v0
.end method

.method public newConnectionReader(Ljava/io/Reader;)Ljava/io/Reader;
    .registers 5
    .param p1, "newReader"    # Ljava/io/Reader;

    .prologue
    .line 135
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    check-cast v1, Lorg/jivesoftware/smack/util/ObservableReader;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableReader;->removeReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 136
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableReader;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/ObservableReader;-><init>(Ljava/io/Reader;)V

    .line 137
    .local v0, "debugReader":Lorg/jivesoftware/smack/util/ObservableReader;
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableReader;->addReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 138
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    .line 139
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    return-object v1
.end method

.method public newConnectionWriter(Ljava/io/Writer;)Ljava/io/Writer;
    .registers 5
    .param p1, "newWriter"    # Ljava/io/Writer;

    .prologue
    .line 143
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    check-cast v1, Lorg/jivesoftware/smack/util/ObservableWriter;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableWriter;->removeWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 144
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableWriter;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/ObservableWriter;-><init>(Ljava/io/Writer;)V

    .line 145
    .local v0, "debugWriter":Lorg/jivesoftware/smack/util/ObservableWriter;
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableWriter;->addWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 146
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    .line 147
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    return-object v1
.end method

.method public userHasLogged(Ljava/lang/String;)V
    .registers 6
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 151
    const-string v2, ""

    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 152
    .local v0, "isAnonymous":Z
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "User logged ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_79

    const-string v2, ""

    :goto_29
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 159
    .local v1, "title":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 160
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 163
    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 164
    return-void

    .line 152
    .end local v1    # "title":Ljava/lang/String;
    :cond_79
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_29
.end method
