#!/bin/bash
DOTFILES_DIR=${HOME}/dotfiles/files
BACKUP_DIR=${HOME}/dotfiles/backup

find ${DOTFILES_DIR} -type f  | while read file ; do
    DIR=$(dirname "${file}")
    DIR=${DIR##${DOTFILES_DIR}}
    FILENAME=$(basename "${file}")
    DESTDIR=${HOME}${DIR}

    if [ ! -e "${DESTDIR}" ] ; then
        mkdir -p "${DESTDIR}"
    fi

    # Backup existing file, if present
    DESTFILE=${DESTDIR}/${FILENAME}
    if [ -e "${DESTFILE}" ] ; then 

        # echo "Backing up ${DESTFILE} to ${BACKUP_DIR}/${DIR}/${FILENAME}"

        if [ ! -e "${BACKUP_DIR}/${DIR}" ] ; then
            # echo "creating Directory: ${BACKUP_DIR}/${DIR}"
            mkdir -p "${BACKUP_DIR}/${DIR}"
        fi
        # cp -L --> dereference in case of a symbolic link
        # copy the link target to a regular file
        cp -L "${DESTFILE}" "${BACKUP_DIR}/${DIR}/"
        rm "${DESTFILE}" # Optionally, seems a bit "cleaner"
    fi
    
    echo "Installing file: ${DESTFILE}"
    ln -sf "${file}" "${DESTFILE}"
done

tic ~/tmux-256color
