package com.stericson.RootTools.internal;

import android.content.Context;
import android.util.Log;
import com.stericson.RootTools.RootTools;
import com.stericson.RootTools.execution.Command;
import com.stericson.RootTools.execution.CommandCapture;
import com.stericson.RootTools.execution.Shell;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.ReadableByteChannel;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* loaded from: RootTools-3.5.jar:com/stericson/RootTools/internal/Installer.class */
class Installer {
    static final String LOG_TAG = "RootTools::Installer";
    static final String BOGUS_FILE_NAME = "bogus";
    Context context;
    String filesPath;

    public Installer(Context context) throws IOException {
        this.context = context;
        this.filesPath = context.getFilesDir().getCanonicalPath();
    }

    protected boolean installBinary(int sourceId, String destName, String mode) {
        long transferFrom;
        File mf = new File(this.filesPath + File.separator + destName);
        if (mf.exists() && getFileSignature(mf).equals(getStreamSignature(this.context.getResources().openRawResource(sourceId)))) {
            return true;
        }
        Log.e(LOG_TAG, "Installing a new version of binary: " + destName);
        try {
            FileInputStream fis = this.context.openFileInput(BOGUS_FILE_NAME);
            fis.close();
        } catch (FileNotFoundException e) {
            FileOutputStream fos = null;
            try {
                try {
                    fos = this.context.openFileOutput(BOGUS_FILE_NAME, 0);
                    fos.write("justcreatedfilesdirectory".getBytes());
                    if (null != fos) {
                        try {
                            fos.close();
                            this.context.deleteFile(BOGUS_FILE_NAME);
                        } catch (IOException e2) {
                        }
                    }
                } catch (Exception ex) {
                    if (RootTools.debugMode) {
                        Log.e(LOG_TAG, ex.toString());
                    }
                    if (null != fos) {
                        try {
                            fos.close();
                            this.context.deleteFile(BOGUS_FILE_NAME);
                        } catch (IOException e3) {
                        }
                    }
                    return false;
                }
            } catch (Throwable th) {
                if (null != fos) {
                    try {
                        fos.close();
                        this.context.deleteFile(BOGUS_FILE_NAME);
                    } catch (IOException e4) {
                    }
                }
                throw th;
            }
        } catch (IOException ex2) {
            if (!RootTools.debugMode) {
                return false;
            }
            Log.e(LOG_TAG, ex2.toString());
            return false;
        }
        InputStream iss = this.context.getResources().openRawResource(sourceId);
        ReadableByteChannel rfc = Channels.newChannel(iss);
        FileOutputStream oss = null;
        try {
            try {
                FileOutputStream oss2 = new FileOutputStream(mf);
                FileChannel ofc = oss2.getChannel();
                long pos = 0;
                try {
                    long size = iss.available();
                    do {
                        transferFrom = pos + ofc.transferFrom(rfc, pos, size - pos);
                        pos = transferFrom;
                    } while (transferFrom < size);
                    if (oss2 != null) {
                        try {
                            oss2.flush();
                            oss2.getFD().sync();
                            oss2.close();
                        } catch (Exception e5) {
                        }
                    }
                    try {
                        iss.close();
                        try {
                            CommandCapture command = new CommandCapture(0, false, "chmod " + mode + " " + this.filesPath + File.separator + destName);
                            Shell.startRootShell().add(command);
                            commandWait(command);
                            return true;
                        } catch (Exception e6) {
                            return true;
                        }
                    } catch (IOException ex3) {
                        if (!RootTools.debugMode) {
                            return false;
                        }
                        Log.e(LOG_TAG, ex3.toString());
                        return false;
                    }
                } catch (IOException ex4) {
                    if (RootTools.debugMode) {
                        Log.e(LOG_TAG, ex4.toString());
                    }
                    if (oss2 != null) {
                        try {
                            oss2.flush();
                            oss2.getFD().sync();
                            oss2.close();
                        } catch (Exception e7) {
                        }
                    }
                    return false;
                }
            } catch (FileNotFoundException ex5) {
                if (RootTools.debugMode) {
                    Log.e(LOG_TAG, ex5.toString());
                }
                if (0 != 0) {
                    try {
                        oss.flush();
                        oss.getFD().sync();
                        oss.close();
                    } catch (Exception e8) {
                    }
                }
                return false;
            }
        } catch (Throwable th2) {
            if (0 != 0) {
                try {
                    oss.flush();
                    oss.getFD().sync();
                    oss.close();
                } catch (Exception e9) {
                }
            }
            throw th2;
        }
    }

    protected boolean isBinaryInstalled(String destName) {
        boolean installed = false;
        File mf = new File(this.filesPath + File.separator + destName);
        if (mf.exists()) {
            installed = true;
        }
        return installed;
    }

    protected String getFileSignature(File f) {
        String signature = "";
        try {
            signature = getStreamSignature(new FileInputStream(f));
        } catch (FileNotFoundException ex) {
            Log.e(LOG_TAG, ex.toString());
        }
        return signature;
    }

    protected String getStreamSignature(InputStream is) {
        String signature = "";
        try {
            try {
                MessageDigest md = MessageDigest.getInstance("MD5");
                DigestInputStream dis = new DigestInputStream(is, md);
                byte[] buffer = new byte[4096];
                while (-1 != dis.read(buffer)) {
                }
                byte[] digest = md.digest();
                StringBuffer sb = new StringBuffer();
                for (byte b : digest) {
                    sb.append(Integer.toHexString(b & 255));
                }
                signature = sb.toString();
                try {
                    is.close();
                } catch (IOException e) {
                }
            } catch (Throwable th) {
                try {
                    is.close();
                } catch (IOException e2) {
                }
                throw th;
            }
        } catch (IOException ex) {
            Log.e(LOG_TAG, ex.toString());
            try {
                is.close();
            } catch (IOException e3) {
            }
        } catch (NoSuchAlgorithmException ex2) {
            Log.e(LOG_TAG, ex2.toString());
            try {
                is.close();
            } catch (IOException e4) {
            }
        }
        return signature;
    }

    private void commandWait(Command cmd) {
        synchronized (cmd) {
            try {
                if (!cmd.isFinished()) {
                    cmd.wait(2000L);
                }
            } catch (InterruptedException ex) {
                Log.e(LOG_TAG, ex.toString());
            }
        }
    }
}
