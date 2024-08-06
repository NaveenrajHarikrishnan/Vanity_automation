#!/bin/bash

server=$1
env=$2
path=$3

case $server in

    lxo)

        case $env in

            dev)
            
                if [ ! -d $path ]
                then
                    echo "Final directory does not exist... Creating"
                    cd /nas/misc/content-ctl-dev
                    mkdir -p github
                    cd github
                    mkdir -p dev
                    cd dev
                    mkdir -p STATIC
                    cd STATIC
                    mkdir -p DOTCOM_MAIN/Vanity
                    cd DOTCOM_MAIN/Vanity
                    ls -lah
                else
                    echo "Final directory exists, nothing to prepare"
                fi 

            ;;

            test)

                if [ ! -d $path ]
                then
                    echo "Final directory does not exist... Creating"
                    cd /nas/misc/content-ctl-qa
                    mkdir -p github
                    cd github
                    mkdir -p qa
                    cd qa
                    mkdir -p STATIC
                    cd STATIC
                    mkdir -p DOTCOM_MAIN/Vanity
                    cd DOTCOM_MAIN/Vanity
                    ls -lah
                else
                    echo "Final directory exists, nothing to prepare"
                fi 

            ;;

            prod)

                if [ ! -d $path ]
                then
                    echo "Final directory does not exist... Creating"
                    cd /nas/misc/content-ctl-prod
                    mkdir -p github
                    cd github
                    mkdir -p prod
                    cd prod
                    mkdir -p STATIC
                    cd STATIC
                    mkdir -p DOTCOM_MAIN/Vanity
                    cd DOTCOM_MAIN/Vanity
                    ls -lah
                else
                    echo "Final directory exists, nothing to prepare"
                fi 

            ;;

            *)

                echo "No environment selected"

            ;;

        esac

    ;;

    lxdd)

        case $env in

            dev)
            
                if [ ! -d $path ]
                then
                    echo "Final directory does not exist... Creating"
                    cd /ecom-static-test/cms
                    if [ ! -d github ]
                    then
                        mkdir -p github
                        cd github
                    else
                        cd github
                    fi
                    mkdir -p dev
                    cd dev
                    mkdir -p STATIC
                    cd STATIC
                    mkdir -p DOTCOM_MAIN/Vanity
                    cd DOTCOM_MAIN/Vanity
                    ls -lah
                else
                    echo "Final directory exists, nothing to prepare"
                fi 

            ;;

            test)

                if [ ! -d $path ]
                then
                    echo "Final directory does not exist... Creating"
                    cd /ecom-static-test/cms
                    if [ ! -d github ]
                    then
                        mkdir -p github
                        cd github
                    else
                        cd github
                    fi
                    mkdir -p "test"
                    cd "test"
                    mkdir -p STATIC
                    cd STATIC
                    mkdir -p DOTCOM_MAIN/Vanity
                    cd DOTCOM_MAIN/Vanity
                    ls -lah
                else
                    echo "Final directory exists, nothing to prepare"
                fi 

            ;;

            prod)

                if [ ! -d $path ]
                then
                    echo "Final directory does not exist... Creating"
                    cd /ecom-static-prod/cms
                    if [ ! -d github ]
                    then
                        mkdir -p github
                        cd github
                    else
                        cd github
                    fi
                    mkdir -p prod
                    cd prod
                    mkdir -p STATIC
                    cd STATIC
                    mkdir -p DOTCOM_MAIN/Vanity
                    cd DOTCOM_MAIN/Vanity
                    ls -lah
                else
                    echo "Final directory exists, nothing to prepare"
                fi 

            ;;

            *)

                echo "No environment selected"

            ;;

        esac

    ;;

    lxod)

        case $env in

            dev)
            
                if [ ! -d $path ]
                then
                    echo "Final directory does not exist... Creating"
                    cd /ecom-static-test-backup/cms
                    if [ ! -d github ]
                    then
                        mkdir -p github
                        cd github
                    else
                        cd github
                    fi
                    mkdir -p dev
                    cd dev
                    mkdir -p STATIC
                    cd STATIC
                    mkdir -p DOTCOM_MAIN/Vanity
                    cd DOTCOM_MAIN/Vanity
                    ls -lah
                else
                    echo "Final directory exists, nothing to prepare"
                fi 

            ;;

            test)

                if [ ! -d $path ]
                then
                    echo "Final directory does not exist... Creating"
                    cd /ecom-static-test-backup/cms
                    if [ ! -d github ]
                    then
                        mkdir -p github
                        cd github
                    else
                        cd github
                    fi
                    mkdir -p "test"
                    cd "test"
                    mkdir -p STATIC
                    cd STATIC
                    mkdir -p DOTCOM_MAIN/Vanity
                    cd DOTCOM_MAIN/Vanity
                    ls -lah
                else
                    echo "Final directory exists, nothing to prepare"
                fi 

            ;;

            prod)

                if [ ! -d $path ]
                then
                    echo "Final directory does not exist... Creating"
                    cd /ecom-static-prod-backup/cms
                    if [ ! -d github ]
                    then
                        mkdir -p github
                        cd github
                    else
                        cd github
                    fi
                    mkdir -p prod
                    cd prod
                    mkdir -p STATIC
                    cd STATIC
                    mkdir -p DOTCOM_MAIN/Vanity
                    cd DOTCOM_MAIN/Vanity
                    ls -lah
                else
                    echo "Final directory exists, nothing to prepare"
                fi 

            ;;

            *)

                echo "No environment selected"

            ;;

        esac

    ;;

    *)

        echo "No server specified..."
        exit 1

    ;;

esac
