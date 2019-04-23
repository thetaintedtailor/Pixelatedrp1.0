print('GO runpix.py -> starting IMPORTs')
import sys
import subprocess
#subprocess.call(["ls","-la"])

cStrDivider = '#----------------------------------------------------------------------------------------------------#'
filename = 'runpix.py'
print("\n IMPORTs complete:- STARTING -> file '%s' . . . " % filename)

## run.sh path
strPath = '/srv/PixelatedRp1.0/server/run.sh'

## .cfg file names
strCfgDev = 'dev_server.cfg'
strCfgProd = 'server.cfg'

def runSubprocess(lstArgsRun):
    print('\n')
    print('#======================================================================#')
    print('#======================================================================#')
    print('running...')
    print('$ %s' % ' '.join(lstArgsRun))
    print('\n')
    subprocess.call(lstArgsRun)

def readCliArgs():
    funcname = '(%s) readCliArgs' % filename
    print('\nPrinting CLI args...\n')
    argCnt = len(sys.argv)
    print('Number of arguments: %i' % argCnt)
    print('Argument List: %s' % str(sys.argv))
    for idx, val in enumerate(sys.argv):
        print('Argv[%i]: %s' % (idx,str(sys.argv[idx])))
    print('\n  DONE printing CLI args...')

print("\n FUNCTIONS declared:- STARTING -> additional '%s' run scripts (if applicable) . . . " % filename)

usage = (":- USAGE examples... \n\n"
         "1) ‘$ python3 runpix.py -dev \n"
         "      - runs dev_server.cfg \n"
         "          - uses custom 'sv_licenseKey' \n"
         "          - uses current IP allocation (0.0.0.0) \n"
         "          - uses default listening port (0.0.0.0:30120) \n\n"
         "2) ‘$ python3 runpix.py -prod \n"
         "      - runs server.cfg \n"
         "          - uses custom 'sv_licenseKey' \n"
         "          - uses current IP allocation (0.0.0.0) \n"
         "          - uses default listening port (0.0.0.0:30120) \n"
         "          - NOTE: '-prod' flag enabled 042319 \n\n"
         "3) ‘$ python3 runpix.py -zap \n"
         "      - runs server.cfg \n"
         "          - uses no 'sv_licenseKey' var set \n"
         "          - uses dynamic zap IP:port assisgnment (last 185.249.196.40:32070) \n"
         "          - WARNING: '-zap' flag expects yield error ref: no 'sv_licenseKey' \n\n"
         "4) examples... \n"
         "      - '$ python runpix.py -dev' \n"
         "      - '$ python runpix.py -prod' \n"
         "      - '$ python runpix.py -zap' \n"
         "      - NOTE: '-prod' flag currently enabled as of 042319 \n"
         "      - WARNING: '-zap' flag expects yield error ref: no 'sv_licenseKey' \n\n"
         "      - . . . \n\n"
         " exiting... \n"
         )


argCnt = len(sys.argv)
if argCnt > 1:
    readCliArgs()
    stringConfig = None
    print('\nChecking CLI flags...')
    for x in range(0, argCnt):
        argv = sys.argv[x]
        if argv == '--help':
            print(" %s \n argv[1]: '--help' detected \n%s \n%s \n%s \n\n" % (cStrDivider,cStrDivider,usage,cStrDivider))
            print("\n ... sys.exit()\n\n")
            sys.exit()

        if argv == '-dev':
            print("\n '-dev' flag detected ... setting %s... (%s)" % (strCfgDev,filename))
            stringConfig = strCfgDev
        
        if argv == '-prod':
            print("\n '-prod' flag detected ... setting %s... (%s)" % (strCfgProd,filename))
            #print("\n NOTE: '-prod' flag currently disabled; please use '-dev'")
            #print("\n ... sys.exit()\n\n")
            #sys.exit()
            stringConfig = strCfgProd

        if argv == '-zap':
            print("\n '-zap' flag detected ... setting %s (w/o 'sv_licenseKey' set)... (%s)" % (strCfgProd,filename))
            print("\nWARNING: '-zap' flag expects yield error ref: no 'sv_licenseKey'")
            stringConfig = strCfgProd

    print('\n  DONE Checking CLI flags...')
    runSubprocess([strPath, '+exec', stringConfig])
    sys.exit()
else:
    print(" 0 flags or no additional agrv detected... (%s) \n\n" % (filename,))
    print("\n ... sys.exit()\n\n")
    sys.exit()



